//
//  View+Modifiers.swift
//  
//
//  Created by Branden Smith on 9/3/20.
//

import Foundation
import SwiftUI

@available(OSX 10.15, iOS 14.0, *)
public extension View {
    func isHidden(_ hidden: Binding<Bool>) -> some View {
        return self.modifier(HiddenViewModifier(isHidden: hidden))
    }
}
