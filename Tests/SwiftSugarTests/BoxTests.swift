//
//  Box.swift
//  
//
//  Created by beforeold on 2022/11/22.
//

import XCTest
@testable import SwiftSugar

final class BoxTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testBoxes() throws {
    typealias Object = NSObject
    
    let obj = Object()
    obj.sugar.set(value: 5, forKey: "intKey")
    XCTAssertEqual(5, obj.sugar.getValue(forKey: "intKey"))
    
    let newObj = Object()
    obj.sugar.set(weakValue: newObj, forKey: "newObjKey")
    XCTAssertTrue(newObj === obj.sugar.getValue(forKey: "newObjKey"))
    
    do {
      let weakBox = WeakSugar(Object())
      XCTAssertEqual(weakBox.value, nil)
      XCTAssertTrue(weakBox.value === nil)
    }
    
    do {
      let weakBox = AnyWeakSugar(Object())
      XCTAssertTrue(weakBox.value === nil)
    }
  }
  
  class Object: SugarCompatible, DynamicSavable, Equatable {
    static func == (lhs: Object, rhs: Object) -> Bool {
      return lhs === rhs
    }
  }
  
  func testBoxes2() throws {
    let obj = Object()
    obj.sugar.set(value: 5, forKey: "intKey")
    XCTAssertEqual(5, obj.sugar.getValue(forKey: "intKey"))
    
    let newObj = Object()
    obj.sugar.set(weakValue: newObj, forKey: "newObjKey")
    XCTAssertTrue(newObj === obj.sugar.getValue(forKey: "newObjKey"))
    
    do {
      let weakBox = WeakSugar(Object())
      XCTAssertEqual(weakBox.value, nil)
      XCTAssertTrue(weakBox.value === nil)
    }
    
    do {
      let weakBox = AnyWeakSugar(Object())
      XCTAssertTrue(weakBox.value === nil)
    }
  }
}
