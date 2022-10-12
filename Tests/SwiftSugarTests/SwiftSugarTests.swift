import XCTest
@testable import SwiftSugar

final class SwiftSugarTests: XCTestCase {
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertTrue(true.assertTrue())
    XCTAssertTrue(false.assertFalse())
  }
  
  func testOnceFlag() {
    let onceFlag = OnceSugar()
    XCTAssertTrue(onceFlag.onceOnly {
      print("ok")
    })
    
    XCTAssertFalse(onceFlag.onceOnly {
      print("ok")
    })
  }
  
  func testOptional() {
    do {
      let o1: Double? = 9
      let r1 = o1.ifNotNil(sqrt)
      XCTAssertEqual(r1, 3)
      XCTAssertFalse(o1.isNil)
      XCTAssertTrue(o1.isNotNil)
    }
    
    do {
      let o1: Double? = nil
      let r1 = o1.ifNotNil(sqrt)
      XCTAssertEqual(r1, nil)
      XCTAssertTrue(o1.isNil)
      XCTAssertFalse(o1.isNotNil)
    }
  }
  
  enum Some {
    case one
  }
  
  func testPrintSugar() {
    let dict: [String: Any] = [
      "ok0": "😄",
      "ok1": 5, "ok2": 3.0,
      "ok3": Some.one,
      "ok4": "中文",
      "ok5": [1, 2, 3, 4.0, [1: 2]]
    ]
    sugarPrintJSON(dict)
    
    let array: [Any] = [
      1,
      2,
      "3 😄",
      4.0,
      [5: 6, 7: [8, 9, "嘿嘿"]]
    ]
    sugarPrintJSON(array)
  }
  
  func testString() {
    XCTAssertEqual("123".sugar.characters, ["1", "2", "3"])
  }
  
  func testOptionalCollection() {
    do {
      var array: [Int]?
      array.append(5)
      XCTAssertEqual(array, [5])
    }
    
    do {
      var array: [Int]? = [1]
      array.append(5)
      XCTAssertEqual(array, [1, 5])
    }
    
    do {
      var array: [Int]?
      array.append(contentsOf: [2, 3])
      XCTAssertEqual(array, [2, 3])
    }
    
    do {
      var array: [Int]? = [1]
      array.append(contentsOf: [2, 3])
      XCTAssertEqual(array, [1, 2, 3])
    }
  }
}
