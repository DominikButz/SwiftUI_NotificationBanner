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
    
    /// hitTest - override function
    /// - Parameters:
    ///   - point: a CGPoint locating the hit event
    ///   - event: UIEvent
    /// - Returns: view of the root view controller or nil 
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == hitView ? nil : hitView
  }
}



#endif
