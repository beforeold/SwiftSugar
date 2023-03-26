//
//  Assert+Sugar.swift
//  
//
//  Created by beforeold on 26/03/23.
//

import Foundation

public extension Bool {
  @discardableResult
  func assertTrue() -> Bool {
    assert(self == true)
    
    return true
  }
  
  @discardableResult
  func assertFalse() -> Bool {
    assert(self == false)
    
    return true
  }
}

public func assertNil<T>(value: T?) {
  assert(value == nil)
}

public func assertUnexpectedError(_ error: Error) {
  assert(false, "unexected error: \(error)")
}
