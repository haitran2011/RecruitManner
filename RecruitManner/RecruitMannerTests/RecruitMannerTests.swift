//
//  RecruitMannerTests.swift
//  RecruitMannerTests
//
//  Created by Jiang Duan on 16/11/8.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import XCTest
@testable import RecruitManner

class RecruitMannerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAlamofireHandyJSON() {
        let exp = expectation(description: "AlamofireHandyJSON")
        
        DoubanApi.shared.fetchMovice() {
            print($0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            // ...
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
