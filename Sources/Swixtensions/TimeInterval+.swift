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
