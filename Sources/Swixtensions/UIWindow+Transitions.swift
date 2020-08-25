//
//  UIWindow+Transitions.swift
//  
//
//  Created by Branden Smith on 8/25/20.
//
// Adopted from: https://github.com/malcommac/UIWindowTransitions/blob/master/Sources/UIWindowTransitions/UIWindowTransitions.swift

import Foundation

#if canImport(UIKit)
public extension UIWindow {
    struct TransitionOptions {

        public enum Curve {
            case linear
            case easeIn
            case easeOut
            case easeInOut

            internal var function: CAMediaTimingFunction {
                let key: String!

                switch self {
                case .linear:
                    key = CAMediaTimingFunctionName.linear.rawValue
                case .easeIn:
                    key = CAMediaTimingFunctionName.easeIn.rawValue
                case .easeOut:
                    key = CAMediaTimingFunctionName.easeOut.rawValue
                case .easeInOut:
                    key = CAMediaTimingFunctionName.easeInEaseOut.rawValue
                }

                return CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: key))
            }
        }

        public enum Direction {
            case fade
            case toTop
            case toBottom
            case toLeft
            case toRight

            internal func transition() -> CATransition {
                let transition = CATransition()
                transition.type = CATransitionType.push
                switch self {
                case .fade:
                    transition.type = CATransitionType.fade
                    transition.subtype = nil
                case .toLeft:
                    transition.subtype = CATransitionSubtype.fromLeft
                case .toRight:
                    transition.subtype = CATransitionSubtype.fromRight
                case .toTop:
                    transition.subtype = CATransitionSubtype.fromTop
                case .toBottom:
                    transition.subtype = CATransitionSubtype.fromBottom
                }
                return transition
            }
        }

        public enum Background {
            case snapshot
            case solidColor(_: UIColor)
            case customView(_: UIView)
        }

        public var duration: TimeInterval = TimeInterval.standardAnimationInterval

        public var direction: TransitionOptions.Direction = .toRight

        public var style: TransitionOptions.Curve = .linear

        public var background: TransitionOptions.Background? = nil

        public init(direction: TransitionOptions.Direction = .toRight, style: TransitionOptions.Curve = .linear) {
            self.direction = direction
            self.style = style
        }

        public init() {}

        internal var animation: CATransition {
            let transition = self.direction.transition()

            transition.duration = self.duration
            transition.timingFunction = self.style.function

            return transition
        }
    }

    func setRootViewController(_ controller: UIViewController, options: TransitionOptions = TransitionOptions()) {
        var transitionWnd: UIWindow? = nil

        if let background = options.background {
            transitionWnd = UIWindow(frame: UIScreen.main.bounds)

            switch background {
            case .snapshot:
                if let currentView = snapshotView(afterScreenUpdates: true) {
                    transitionWnd?.rootViewController = UIViewController.newController(withView: currentView, frame: transitionWnd!.bounds)
                }
            case .customView(let view):
                transitionWnd?.rootViewController = UIViewController.newController(withView: view, frame: transitionWnd!.bounds)
            case .solidColor(let color):
                transitionWnd?.backgroundColor = color
            }

            transitionWnd?.makeKeyAndVisible()
        }

        self.layer.add(options.animation, forKey: kCATransition)
        self.rootViewController = controller
        self.makeKeyAndVisible()

        if let wnd = transitionWnd {
            DispatchQueue.main.asyncAfter(deadline: (.now() + 1 + options.duration), execute: {
                wnd.removeFromSuperview()
            })
        }
    }
}

internal extension UIViewController {
    static func newController(withView view: UIView, frame: CGRect) -> UIViewController {
        view.frame = frame
        let controller = UIViewController()
        controller.view = view
        return controller
    }

}
#endif
