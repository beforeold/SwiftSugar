//
//  File.swift
//  
//
//  Created by beforeold on 2023/3/15.
//

import Foundation

public final class ReferenceBox<T> {
  public var value: T
  
  public init(_ value: T) {
    self.value = value
  }
}
