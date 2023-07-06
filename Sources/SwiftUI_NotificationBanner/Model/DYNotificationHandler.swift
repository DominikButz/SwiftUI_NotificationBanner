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
                #if os(iOS)
                if let hapticFeedbackType = self.currentNotification?.hapticFeedbackType {
                    self.feedbackGenerator.notificationOccurred(hapticFeedbackType)
                }
                #endif
            }
            if operation.isCancelled == false {
                Thread.sleep(forTimeInterval: notification.displayDuration)
            }
            
            if operation.isCancelled == false {
                DispatchQueue.main.async {
                    self.remove(notification: notification)
                }
        
                Thread.sleep(forTimeInterval: 1.1) // to allow the banner to disappear before next one appears
            }
        }
        
        self.queuedOperations[notification.id] = operation
        self.queue.addOperation(operation)
        
        
    }
    
    func remove(notification: DYNotification, userInitiated: Bool = false) {
        if self.currentNotification == notification {
            self.currentNotification = nil
        }

        if let operation = self.queuedOperations.removeValue(forKey: notification.id) as? BlockOperation {
            if userInitiated {
                operation.cancel()
            }
        }
 
    }
    
}



//public class DYNotificationHandlerOld: ObservableObject {
//    
//    @Published var currentNotification: DYNotification? {
//        didSet {
//            if currentNotification == nil {
//                self.displayNextNotificationIfAvailable()
//            }
//        }
//    }
//    @Published var notificationQueue: Array<DYNotification> = []
//    
//    func add(notification: DYNotification) {
//        
//        if currentNotification == nil {
//            self.currentNotification = notification
//            self.removeCurrentNotificationIfNeeded()
//            
//        } else {
//            // there is already a notification displaying
//            notificationQueue.append(notification)
//        }
//        
//    }
//    
//    func displayNextNotificationIfAvailable() {
//        if let nextNotification = self.notificationQueue.first {
//            // wait 1 sec to let previous message disappear with animation
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//                self.currentNotification = nextNotification
//                self.notificationQueue.removeFirst()
//                self.removeCurrentNotificationIfNeeded()
//            })
//
//        }
//    }
//    
//    func removeCurrentNotificationIfNeeded() {
//        if let duration = self.currentNotification?.displayDuration {
//            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
//                if self.currentNotification != nil {  // user might have removed the notification by tapping already!
//                    self.currentNotification = nil
//                }
//            })
//        }
//    }
//    
//}

