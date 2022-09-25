//
//  Optional+Sugar.swift
//  
//
//  Created by beforeold on 2022/8/22.
//

import Foundation

public extension Optional {
    /// call the block if not nil
    @inlinable func ifNotNil<U>(_ block: (Wrapped) throws -> U) rethrows -> U? {
        return try flatMap(block)
    }
}

public extension Optional {
    var isNil: Bool {
        return self == nil
    }
    
    var isNotNil: Bool {
        return self != nil
    }
}

extension Optional where Wrapped: CustomStringConvertible {
    public func toString() -> String {
        self?.description ?? "nil"
    }
}
