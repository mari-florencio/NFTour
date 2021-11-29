//
//  CachedUnit.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation

class CachedUnit<K: Hashable, M> {
    
    var value: M {
        didSet {
            invalidated = false
            lastRefresh = Date()
        }
    }
    
    internal init(value: M) {
        self.value = value
    }
    
    fileprivate var invalidated: Bool = false
    var lastRefresh: Date? = nil
    
    func invalidate() {
        invalidated = true
    }
    
    /** Time interval is in seconds */
    func isValid(maxExpiration: TimeInterval) -> Bool {
        var expired = false
        if let lastRefresh = lastRefresh {
            expired = Date().timeIntervalSince(lastRefresh) > maxExpiration
        }
        return !invalidated && !expired
    }
    
}
