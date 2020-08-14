//
//  UIView+Layer.swift
//  
//
//  Created by Branden Smith on 8/14/20.
//

import Foundation

#if !os(macOS)
import UIKit
#endif

#if !os(macOS)
public extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
#endif
