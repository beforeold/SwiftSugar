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

extension Collection where Element: Collection {
  @inlinable public func map2d<T>(_ transform: (Self.Element.Element) throws -> T) rethrows -> [[T]] {
    try map { list in
      try list.map(transform)
    }
  }
}

extension Collection {
  @inlinable public func ignoreMap<T>(_ transform: () throws -> T) rethrows -> [T] {
    try map { _ in
      try transform()
    }
  }
}

extension Array {
  @inlinable public init(count: Int, repeating: () -> Element) {
    self = (0..<count).map { _ in
      repeating()
    }
  }
}
