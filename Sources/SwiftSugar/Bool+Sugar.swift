//
//  Bool+Sugar.swift
//  
//
//  Created by beforeold on 2022/8/20.
//

import Foundation

public extension Bool {
  func ifTrue(_ success: () throws -> Void) rethrows {
    if self {
      try success()
    }
  }
  
  func ifFalse(_ failure: () throws -> Void) rethrows {
    if self == false {
      try failure()
    }
  }
  
  func ifFalseOrNil(_ failure: () throws -> Void) rethrows {
    if self == false {
      try failure()
    }
  }
}

public extension Optional where Wrapped == Bool {
  func ifTrue(_ success: () throws -> Void) rethrows {
    if self == true {
      try success()
    }
  }
  
  func ifFalse(_ failure: () throws -> Void) rethrows {
    if self == false {
      try failure()
    }
  }
  
  func ifFalseOrNil(_ failure: () throws -> Void) rethrows {
    if self != true {
      try failure()
    }
  }
}

public extension Bool {
  var isFalse: Bool {
    return !self
  }
  
  var opposite: Bool {
    !self
  }
}
