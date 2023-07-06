//
//  SwiftUI_NotificationBanner_Example_macOSApp.swift
//  SwiftUI_NotificationBanner_Example_macOS
//
//  Created by Dominik Butz on 4/7/2023.
//
import SwiftUI
import SwiftUI_NotificationBanner

@main
struct SwiftUI_NotificationBanner_ExampleApp: App {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var notificationHandler = DYNotificationHandler()

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(notificationHandler)
                .notificationView(handler: notificationHandler, notificationBanner: {notification in
                    
                    DYNotificationBanner(notification: notification, frameWidth: 450)
                        .text(color: foregroundColorForNotification(type: notification.type))
                        .image(color: foregroundColorForNotification(type: notification.type))
      //                  .backgroundGradientForNotificationType(success: LinearGradient(colors: [.green.opacity(0.4), .green], startPoint: .leading, endPoint: .trailing), error: LinearGradient(colors: [.red, .red.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                        .dropShadow(color: colorScheme == .light ? .gray.opacity(0.4) : .clear, radius: 5, x: 0, y: notification.displayEdge == .top ? 5 : -5)
                        .cornerRadius(self.cornerRadius(displayEdge: notification.displayEdge))
                    
                })
            
        }
        
 


    }
    
    
    func foregroundColorForNotification(type: DYNotificationType)->Color {
        switch type {
        case .info, .error:
            return .white
        case .warning, .success:
            return .black
        }
    }

    
    func cornerRadius(displayEdge: Edge)-> CGFloat {
        return 10
    }
}
