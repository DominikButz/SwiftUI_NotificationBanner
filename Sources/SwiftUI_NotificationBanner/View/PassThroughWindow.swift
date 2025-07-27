//
//  PassThroughWindow.swift
//  
//
//  Created by Federico Zanetello (www.fivestars.blog) in 2021
//


#if canImport(UIKit)
import Foundation
import UIKit
/// PassThroughWindow
public class PassThroughWindow: UIWindow {
    public var notificationHandler: DYNotificationHandler?
    /// hitTest - override function
    /// - Parameters:
    ///   - point: a CGPoint locating the hit event
    ///   - event: UIEvent
    /// - Returns: view of the root view controller or nil 
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        print("hit view exists ? ", super.hitTest(point, with: event) != nil)
        guard let hitView = super.hitTest(point, with: event) else { return nil }
        if  notificationHandler?.currentNotification != nil {
            return rootViewController?.view
        }
        let rootViewIsHitView = rootViewController?.view == hitView
        return rootViewIsHitView ? nil : hitView
  }
}



#endif
