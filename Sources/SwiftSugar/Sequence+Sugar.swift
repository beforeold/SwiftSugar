//
//  Sequence+Sugar.swift
//  
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

public extension Sequence {
  /// join the sequence with seperator, for example transform array [1, 2, 3] into string "1,2,3"
  func componentsJoined(by seperator: String = ",") -> String {
    return map { "\($0)" }.joined()
  }
}

public extension Sequence {
  func grouped<U: Equatable, V>(
    by: (Element) throws -> U,
    transform: (Element) throws -> V
  ) rethrows -> [(U, [V])] {
    var groupCategorized: [(U, [V])] = []
    for element in self {
      let groupKey = try by(element)
      let value = try transform(element)
      
      guard let index = groupCategorized.firstIndex(where: { $0.0 == groupKey }) else {
        groupCategorized.append((groupKey, [value]));
        continue
      }
      groupCategorized[index].1.append(value)
    }
    
    return groupCategorized
  }
}
