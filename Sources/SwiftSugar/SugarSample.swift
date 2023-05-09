//
//  SugarSample.swift
//  
//
//  Created by beforeold on 5/9/23.
//

import Foundation


public struct SugarSample {
  /// sample with percentage
  /// - Parameters:
  ///   - value: the percent
  ///   - action: the action if sampled
  /// - Returns: whether sampled
  @discardableResult public static func percent(
    _ value: Int,
    action: () -> Void
  ) -> Bool {
    let matches = matchesPercent(value)
    if matches {
      action()
    }
    
    return matches
  }
  
  /// get random match percent result
  /// - Parameter value: the percent
  /// - Returns: whether sampled
  public static func matchesPercent(_ value: Int) -> Bool {
    assert((0..<100).contains(value))
    
    guard let ran = (0..<100).randomElement() else {
      return false
    }
    
    let matches = ran < value
    return matches
  }
}
