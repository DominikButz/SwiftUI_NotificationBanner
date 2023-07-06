//
//  ContentView.swift
//  SwiftUI_NotificationBanner_Example
//
//  Created by Dominik Butz on 11/11/2022.
//

import SwiftUI
import SwiftUI_NotificationBanner

struct RootView: View {
    #if os(iOS)
    @EnvironmentObject var sceneDelegate: SceneDelegate
    #endif
    @EnvironmentObject var notificationHandler:  DYNotificationHandler
    
    var body: some View {
        Example().environmentObject(notificationHandler)
        #if os(iOS)
        .onAppear {
            sceneDelegate.notificationHandler = notificationHandler
        }
        #endif
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
