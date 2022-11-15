//
//  DYNotification.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI



public struct DYNotification: Identifiable, Equatable {

    public let id: String
    public let message: String
    public var title: String?
    public var image: Image?
    public let type: DYNotificationType
    public let displayDuration: TimeInterval
    public let dismissOnTap: Bool
    public let displayEdge: Edge
    public var hapticFeedbackType: UINotificationFeedbackGenerator.FeedbackType?
    public var tapHandler: (()->Void)?
    
    public init(id: String = UUID().uuidString, title: String? = nil, message: String,  image: Image? = nil, type: DYNotificationType = .info, displayDuration: TimeInterval = 3, dismissOnTap: Bool = true, displayEdge: Edge = .top, hapticFeedbackType:  UINotificationFeedbackGenerator.FeedbackType? = nil,  tapHandler: (()->Void)? = nil) {
        
    
        self.id = id
        self.message = message
        self.title = title
        self.image = image
        self.type = type
        self.displayDuration = displayDuration
        self.dismissOnTap = dismissOnTap
        self.displayEdge = displayEdge
        self.hapticFeedbackType = hapticFeedbackType
        self.tapHandler = tapHandler
    }
    
    public static func == (lhs: DYNotification, rhs: DYNotification) -> Bool {
        lhs.id == rhs.id
    }
    
}

public enum DYNotificationType {

    case info, success, warning, error
}

//public enum DYNotificationBannerEdge {
//    case top, bottom
//}


//public struct DYNotification<N: View>: Identifiable, Equatable {
//
//    public let id: String
//
//    public let displayDuration: TimeInterval
//    public let dismissOnTap: Bool
//    public var notificationView: N
//
//    public init(id: String = UUID().uuidString, displayDuration: TimeInterval = 3, dismissOnTap: Bool = true, notificationView: N) {
//        self.id = id
//        self.displayDuration = displayDuration
//        self.dismissOnTap = dismissOnTap
//        self.notificationView = notificationView
//    }
//
//    public static func == (lhs: DYNotification, rhs: DYNotification) -> Bool {
//        lhs.id == rhs.id
//    }
//
//}
