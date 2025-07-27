//
//  DYNotificationHandler.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI


/// Notification Handler
public class DYNotificationHandler: ObservableObject {

    #if os(iOS)
    let feedbackGenerator: UINotificationFeedbackGenerator
    #endif
    let queue: OperationQueue
    
    var queuedOperations: [String: Operation ] = [:]
    var currentTimer: DispatchSourceTimer?
    var currentTimerNotificationId: String?
    
    @Published public var currentNotification: DYNotification?
    
    public init() {
        
        self.queue = OperationQueue()
        self.queue.maxConcurrentOperationCount = 1
        self.queue.qualityOfService = .userInteractive
        
        #if os(iOS)
        self.feedbackGenerator = UINotificationFeedbackGenerator()
        #endif
        
        
    }
    
    
    /// show function
    /// - Parameter notification: a DYNotificationHandler object
    public func show(notification: DYNotification) {
        #if os(iOS)
        self.feedbackGenerator.prepare()
        #endif
        
        let operation = BlockOperation()
        
        operation.addExecutionBlock {
            DispatchQueue.main.async {
                self.currentNotification = notification
                self.currentTimerNotificationId = notification.id
                
                #if os(iOS)
                if let hapticFeedbackType = self.currentNotification?.hapticFeedbackType {
                    self.feedbackGenerator.notificationOccurred(hapticFeedbackType)
                }
                #endif
                
                // Create and start timer for auto-dismissal
                self.startDismissalTimer(for: notification)
            }
        }
        
        self.queuedOperations[notification.id] = operation
        self.queue.addOperation(operation)
    }
    
    private func startDismissalTimer(for notification: DYNotification) {
        // Cancel any existing timer
        currentTimer?.cancel()
        
        // Create new timer
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.main)
        timer.schedule(deadline: .now() + notification.displayDuration)
        
        timer.setEventHandler { [weak self] in
            guard let self = self else { return }
            
            // Only auto-dismiss if this is still the current notification
            if self.currentTimerNotificationId == notification.id {
                self.remove(notification: notification, userInitiated: false)
            }
        }
        
        currentTimer = timer
        timer.resume()
    }
    
    func remove(notification: DYNotification, userInitiated: Bool = false) {
        if self.currentNotification == notification {
            self.currentNotification = nil
            
            // Cancel the current timer since notification is being removed
            if currentTimerNotificationId == notification.id {
                currentTimer?.cancel()
                currentTimer = nil
                currentTimerNotificationId = nil
            }
        }

        if let operation = self.queuedOperations.removeValue(forKey: notification.id) as? BlockOperation {
            operation.cancel()
            
            // If user initiated dismissal, show next notification immediately (after brief animation delay)
            // If auto-dismissal, use longer delay
            let delay: TimeInterval = userInitiated ? 0.5 : 1.1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                // The queue will automatically process the next operation
            }
        }
    }
    
}

