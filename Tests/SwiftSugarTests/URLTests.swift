//
//  URLTests.swift
//  
//
//  Created by beforeold on 2022/10/7.
//

import XCTest
@testable import SwiftSugar

final class URLTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testURLIOS() throws {
        if #available(iOS 16.0, *) {
            XCTAssertEqual(URL.currentDirectory(), URL.sugar.currentDirectory())
            XCTAssertEqual(URL.homeDirectory, URL.sugar.homeDirectory)
            XCTAssertEqual(URL.temporaryDirectory, URL.sugar.temporaryDirectory)
            XCTAssertEqual(URL.cachesDirectory, URL.sugar.cachesDirectory)
            XCTAssertEqual(URL.applicationDirectory, URL.sugar.applicationDirectory)
            XCTAssertEqual(URL.libraryDirectory, URL.sugar.libraryDirectory)
            XCTAssertEqual(URL.userDirectory, URL.sugar.userDirectory)
            XCTAssertEqual(URL.documentsDirectory, URL.sugar.documentsDirectory)
            XCTAssertEqual(URL.documentsDirectory, URL.sugar.documentsDirectory)
            XCTAssertEqual(URL.desktopDirectory, URL.sugar.desktopDirectory)
            XCTAssertEqual(URL.applicationSupportDirectory, URL.sugar.applicationSupportDirectory)
            XCTAssertEqual(URL.downloadsDirectory, URL.sugar.downloadsDirectory)
            XCTAssertEqual(URL.moviesDirectory, URL.sugar.moviesDirectory)
            XCTAssertEqual(URL.musicDirectory, URL.sugar.musicDirectory)
            XCTAssertEqual(URL.picturesDirectory, URL.sugar.picturesDirectory)
            XCTAssertEqual(URL.sharedPublicDirectory, URL.sugar.sharedPublicDirectory)
            
            // not available in iOS
            // XCTAssertEqual(URL.trashDirectory, URL.sugar.trashDirectory)
            XCTAssertEqual(URL.homeDirectory(forUser: "brook"), URL.sugar.homeDirectory(forUser: "brook"))
            
            XCTAssertEqual(URL.homeDirectory, URL.sugar.homeDirectory)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
