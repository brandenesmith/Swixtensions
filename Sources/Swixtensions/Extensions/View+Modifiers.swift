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

    /// Calls the completion handler whenever an animation on the given value completes.
    /// taken from https://www.avanderlee.com/swiftui/withanimation-completion-callback/
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - completion: The completion callback to call once the animation completes.
    /// - Returns: A modified `View` instance with the observer attached.
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}
