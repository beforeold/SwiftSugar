//
//  CollectionTests.swift
//  
//
//  Created by beforeold on 2022/11/14.
//

import XCTest
@testable import SwiftSugar

final class CollectionTests: XCTestCase {
  func test_map2d() throws {
    struct Person {
      var name: String
      init(_ name: String) {
        self.name = name
      }
    }
    
    let array = [
      [Person("brook1"), Person("brook2")],
      [Person("brook3"), Person("brook4")],
    ]
    
    XCTAssertEqual(array.map2d(\.name), [
      ["brook1", "brook2"],
      ["brook3", "brook4"],
    ])
  }
  
  func test_ignoreMap() {
    let array = [1, 2, 3]
    XCTAssertEqual(
      array.ignoreMap { "666" },
      ["666", "666", "666"]
    )
  }
  
  func test_array_repeating() {
    let array = Array(count: 3) {
      "555"
    }
    
    XCTAssertEqual(
      array,
      ["555", "555", "555"]
    )
  }
}
