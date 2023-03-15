//
//  ErrorBox.swift
//  
//
//  Created by beforeold on 2023/3/15.
//

import Foundation

public struct ErrorBox<Value>: Error {
  public let value: Value
  public init(_ value: Value) {
    self.value = value
  }
}
