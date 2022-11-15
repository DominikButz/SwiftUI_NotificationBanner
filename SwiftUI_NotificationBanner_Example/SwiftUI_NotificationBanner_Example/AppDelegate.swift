//
//  AppDelegate.swift
//  SwiftUI_NotificationBanner_Example
//
//  Created by Dominik Butz on 14/11/2022.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    // not required in this example
//      func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
//      ) -> Bool {
//        // ...
//        return true
//      }
    
    func application(
      _ application: UIApplication,
      configurationForConnecting connectingSceneSession: UISceneSession,
      options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
      let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
      sceneConfig.delegateClass = SceneDelegate.self
      return sceneConfig
    }
}
