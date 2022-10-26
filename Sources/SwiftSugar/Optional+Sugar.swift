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

public extension Optional {
  @inlinable func `let`(execute: (Wrapped) throws -> Void) rethrows {
    if let self = self {
      try execute(self)
    }
  }
  
  @inlinable mutating func `var`(excecute: (inout Wrapped) throws -> Void) rethrows {
    if self != nil {
      try excecute(&(self!))
    }
  }
}
