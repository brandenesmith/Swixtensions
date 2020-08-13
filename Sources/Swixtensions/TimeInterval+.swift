//
//  TimeInterval+.swift
//  
//
//  Created by Branden Smith on 8/13/20.
//

import Foundation

public extension TimeInterval {
    static let oneMinute = 60.0
    static let oneHour = oneMinute * 60.0
    static let oneDay = oneHour * 24.0
}

public extension TimeInterval {
    /// The standard animation interval for use without the app. The value for this
    /// constant was derived from the deprecated method `setAnimationDuration(_:)` on
    /// UIView. See https://developer.apple.com/documentation/uikit/uiview/1622617-setanimationduration
    static let standardAnimationInterval = 0.2
}

public extension TimeInterval {
    var inSeconds: TimeInterval {
        return self
    }

    var inMinutes: TimeInterval {
        return self / 60.0
    }

    var inHours: TimeInterval {
        return self.inMinutes / 60.0
    }

    var inDays: TimeInterval {
        return self.inHours / 24.0
    }
}
