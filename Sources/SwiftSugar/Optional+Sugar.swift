//
//  Optional+Sugar.swift
//  
//
//  Created by beforeold on 2022/8/22.
//

import Foundation

public extension Optional {
  @inlinable func ifSome<U>(_ block: (Wrapped) throws -> U) rethrows -> U? {
    if let unwapped = self {
      return try block(unwapped)
    }
    else {
      return nil
    }
  }
}
