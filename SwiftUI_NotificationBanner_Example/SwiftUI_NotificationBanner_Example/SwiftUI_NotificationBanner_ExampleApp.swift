//
//  SwiftUI_NotificationBanner_ExampleApp.swift
//  SwiftUI_NotificationBanner_Example
//
//  Created by Dominik Butz on 11/11/2022.
//

import SwiftUI
import SwiftUI_NotificationBanner

@main
struct SwiftUI_NotificationBanner_ExampleApp: App {
    
    @StateObject var notificationHandler = DYNotificationHandler()
    
    @UIApplicationDelegateAdaptor var delegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(notificationHandler)  
        }

    }
}



