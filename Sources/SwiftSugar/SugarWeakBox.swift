//
//  SugarWeakBox.swift
//  
//
//  Created by beforeold on 2022/11/21.
//

import Foundation

/// a reference type box for a value, like Optional Enum,
final public class SugarWeakBox<Value: AnyObject> {
  public weak var value: Value?
  
  public init(_ value: Value? = nil) {
    self.value = value
  }
}

final public class SugarAnoymousWeakBox {
  public weak var value: AnyObject?
  
  public init<Value: AnyObject>(_ value: Value? = nil) {
    self.value = value
  }
}
