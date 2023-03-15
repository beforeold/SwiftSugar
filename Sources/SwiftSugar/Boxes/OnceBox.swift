//
//  File.swift
//  
//
//  Created by beforeold on 2023/3/15.
//

import Foundation

/// a box to check specified key
public final class OnceBox {
  private var keys: Set<String> = []
  
  public init() {
  }
  
  public func checkHas(_ key: String) -> Bool {
    let inserted = keys.insert(key).inserted
    return !inserted
  }
}

