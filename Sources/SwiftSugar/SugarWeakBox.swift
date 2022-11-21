//
//  SugarWeakBox.swift
//  
//
//  Created by beforeold on 2022/11/21.
//

import Foundation

/// a reference type box for a value, like Optional Enum,
final class SugarWeakBox<Value: AnyObject> {
  public weak var value: Value?
  
  public init(value: Value? = nil) {
    self.value = value
  }
}
