//
//  SugarValueBox.swift
//  
//
//  Created by beforeold on 2022/11/20.
//

import Foundation

/// a reference type box for a value, like Optional Enum,
final public class SugarValueBox<Value> {
  public var value: Value?
  
  public init(_ value: Value? = nil) {
    self.value = value
  }
}
