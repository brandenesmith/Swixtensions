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
    var inSeconds: Double {
        return self
    }

    var inMinutes: Double {
        return self / 60.0
    }

    var inHours: Double {
        return self.inMinutes / 60.0
    }

    var inDays: Double {
        return self.inHours / 24.0
    }
}
