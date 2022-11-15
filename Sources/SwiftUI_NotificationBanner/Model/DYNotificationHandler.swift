//
//  DYNotificationHandler.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI



public class DYNotificationHandler: ObservableObject {


    let feedbackGenerator: UINotificationFeedbackGenerator
    
    let queue = DispatchQueue(label: "com.DYNotificationBanner.dispatch.serial")
    
    @Published public var currentNotification: DYNotification?
    
    public init() {

        self.feedbackGenerator = UINotificationFeedbackGenerator()
    
    }
    
    
    public func show(notification: DYNotification) {
        self.feedbackGenerator.prepare()
        
        queue.async {
     
            DispatchQueue.main.async {
                self.currentNotification = notification
                if let hapticFeedbackType = self.currentNotification?.hapticFeedbackType {
                    self.feedbackGenerator.notificationOccurred(hapticFeedbackType)
                }
            }
            Thread.sleep(forTimeInterval: notification.displayDuration)
            DispatchQueue.main.async {
                self.remove(notification: notification)
            }
          
            Thread.sleep(forTimeInterval: 1.1) // to allow the banner to disappear before next one appears
        }
        
        
    }
    
    func remove(notification: DYNotification) {
        if self.currentNotification == notification {
            self.currentNotification = nil
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

