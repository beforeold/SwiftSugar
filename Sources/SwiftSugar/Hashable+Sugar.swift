//
//  Hashable+Sugar.swift
//  
//
//  Created by beforeold on 2022/10/11.
//

import Foundation

public extension Hashable where Self: AnyObject {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs === rhs
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self))
  }
  
}
