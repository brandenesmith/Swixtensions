//
//  File.swift
//  
//
//  Created by Branden Smith on 9/3/20.
//

import Foundation
import SwiftUI

/// A view modifier for hiding and showing views based
/// on the current value of the `isHidden` binding.
@available(OSX 10.15, iOS 14.0, *)
public struct HiddenViewModifier: ViewModifier {
    @Binding public var isHidden: Bool

    @ViewBuilder
    public func body(content: Content) -> some View {
        if isHidden {
            content.hidden()
        } else {
            content
        }
    }
}
