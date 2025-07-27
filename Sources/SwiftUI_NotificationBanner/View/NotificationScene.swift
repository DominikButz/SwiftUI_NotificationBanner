//
//  SwiftUIView.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import SwiftUI

internal struct NotificationScene<N: View>: ViewModifier {
    @ObservedObject var notificationHandler: DYNotificationHandler
    let animation: Animation
    var notificationView: (DYNotification)->N
    
    func body(content: Content)-> some View {

            ZStack {
                
                content

                    VStack {
                        
                        if let notification = self.notificationHandler.currentNotification, notification.displayEdge == .bottom {
                            Spacer()
                        }
                        
                        if let notification = self.notificationHandler.currentNotification {
                            self.notificationView(notification)
                                .onTapGesture {
                                    print("tapped notification banner view")
                                    if notification.dismissOnTap {
                                        self.notificationHandler.remove(notification: notification, userInitiated: true) // remove the current notfication, initiated by user
                                    }
                                    print("calling tap handler if applicable")
                                    notification.tapHandler?()
                                }
                                .id(notification.id)
                                .transition(AnyTransition.move(edge: notification.displayEdge))
                            
                        }
                        
                        if let notification = self.notificationHandler.currentNotification, notification.displayEdge == .top {
                            Spacer()
                        }
                    }
                    
               
            }
            .edgesIgnoringSafeArea(.all)
            .animation(animation, value: notificationHandler.currentNotification)
        


    }
    

    
}

public extension View {
    
    /// notificationView modifier function
    /// - Parameters:
    ///   - handler: a DYNotificationHandler object
    ///   - animation: appear animation of the notfification banner
    ///   - notificationView: notificationView closue - return a DYNotificationView or a custom view.
    /// - Returns: some View
    func notificationView<N: View>(handler: DYNotificationHandler, animation: Animation = .easeInOut(duration: 0.5), notificationBanner: @escaping (DYNotification)->N)->some View {
        self.modifier(NotificationScene(notificationHandler: handler, animation: animation, notificationView:  notificationBanner))
    }
    
}

//struct DYNotificationScene_Previews: PreviewProvider {
//    static var previews: some View {
//        DYNotificationScene()
//    }
//}
