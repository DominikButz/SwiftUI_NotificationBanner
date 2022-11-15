//
//  PassThroughWindow.swift
//  
//
//  Created by Federico Zanetello (www.fivestars.blog) in 2021
//

import Foundation
import UIKit

public class PassThroughWindow: UIWindow {
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    guard let hitView = super.hitTest(point, with: event) else { return nil }
    return rootViewController?.view == hitView ? nil : hitView
  }
}
