//
//  SceneDelegate.swift
//  SwiftUI_NotificationBanner_Example
//
//  Created by Dominik Butz on 14/11/2022.
//

import Foundation
import SwiftUI
import SwiftUI_NotificationBanner

class SceneDelegate: UIResponder, UIWindowSceneDelegate, ObservableObject {
    
    var notificationHandler: DYNotificationHandler? {
      didSet {
        setupNotificationWindow()
      }
    }

    var notificationWindow: UIWindow?
    weak var windowScene: UIWindowScene?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
      windowScene = scene as? UIWindowScene

  }

    // without a second app window, the notification banner will not appear above a sheet, fullScreenCover etc.
    // special thanks to Federico Zanetello (www.fivestars.blog) for this function
    func setupNotificationWindow() {
      guard let windowScene = windowScene, let notificationHandler = notificationHandler else {

        return
      }

      let notificationViewController = UIHostingController(rootView: NotificationRootView().environmentObject(notificationHandler))
      notificationViewController.view.backgroundColor = .clear

      let notificationWindow = PassThroughWindow(windowScene: windowScene)
      notificationWindow.rootViewController = notificationViewController
      notificationWindow.isHidden = false
      self.notificationWindow = notificationWindow
    }
}
