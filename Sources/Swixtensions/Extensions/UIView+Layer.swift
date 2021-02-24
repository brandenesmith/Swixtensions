//
//  UIView+Layer.swift
//  
//
//  Created by Branden Smith on 8/14/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
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
