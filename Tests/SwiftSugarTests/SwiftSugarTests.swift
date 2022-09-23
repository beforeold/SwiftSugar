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
        let onceFlag = OnceFlag()
        XCTAssertTrue(onceFlag.onceOnly {
            print("ok")
        })
        
        XCTAssertFalse(onceFlag.onceOnly {
            print("ok")
        })
    }
}
