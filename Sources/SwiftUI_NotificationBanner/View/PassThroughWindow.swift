//
//  PassThroughWindow.swift
//
//
//  Created by Federico Zanetello (www.fivestars.blog) in 2021
//

#if canImport(UIKit)
  import Foundation
  import UIKit
  /// PassThroughWindow. can used as window for a custom notification root view. This window is placed above the existing app window
  public class PassThroughWindow: UIWindow {
    public var notificationHandler: DYNotificationHandler?
    /// hitTest - override function
    /// - Parameters:
    ///   - point: a CGPoint locating the hit event
    ///   - event: UIEvent
    /// - Returns: view of the root view controller or nil
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
      guard let hitView = super.hitTest(point, with: event) else {
       
        return nil
      }

      // If there's no notification showing, pass through touches to the main window
      guard let _ = notificationHandler?.currentNotification else {
      
        return rootViewController?.view == hitView ? nil : hitView
      }
        
      if let rootView = rootViewController?.view,
        let notificationView = rootView.hitTest(point, with: event),
        notificationView.isDescendant(of: rootView)
      {

        //print("passthrough window: touched the notifcation root view")
        return hitView
      }

      // Otherwise, pass through the touch to the window below
      return nil
    }


  }

#endif
