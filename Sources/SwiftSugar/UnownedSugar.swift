//
//  UnownedSugar.swift
//  
//
//  Created by beforeold on 2022/12/12.
//

import Foundation

/// can be used as object on publisher.assignTo:on:
public class UnownedSugar<T: AnyObject> {
  public unowned var value: T
  
  public init(_ value: T) {
    self.value = value
  }
}
