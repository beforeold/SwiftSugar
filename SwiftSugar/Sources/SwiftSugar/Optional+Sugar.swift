//
//  File.swift
//  
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation

public extension Optional {
  @inlinable func ifNonnull<U>(_ block: (Wrapped) throws -> U) rethrows -> U? {
    if let unwapped = self {
      return try block(unwapped)
    }
    else {
      return nil
    }
  }
}
