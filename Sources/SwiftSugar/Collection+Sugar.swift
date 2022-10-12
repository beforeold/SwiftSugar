//
//  Collection+Sugar.swift
//  
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

public extension Collection {
  var isNotEmpty: Bool {
    return !isEmpty
  }
}

public extension Optional where Wrapped: RangeReplaceableCollection {
  mutating func append(_ element: Wrapped.Element) {
    var collection = self ?? .init()
    collection.append(element)
    self = collection
  }
  
  mutating func append<S>(contentsOf newElements: S) where S : Sequence, Wrapped.Element == S.Element {
    var collection = self ?? .init()
    collection.append(contentsOf: newElements)
    self = collection
  }
}
