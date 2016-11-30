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
        
        DoubanApi.shared.fetchMovice(start: 0, count: 1) {
            debugPrint($0)
            $0.handleValue(handler: {
                XCTAssertEqual($0.count, 1)
                XCTAssertEqual($0.start, 0)
                XCTAssertEqual($0.total, 250)
                XCTAssertEqual($0.title, "豆瓣电影Top250")
            })
            $0.handleError(handler: {
                XCTFail("\($0)")
            })
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            // ...
        }
    }
    
    func testDoubanWorker() {
        let exp = expectation(description: "douban worker")
        
        let worker = MovieWorker(store: MovieCloud())
        worker.fetchMovicesInfo(start: 0, count: 1) {
            debugPrint($0)
            
            guard let info = $0 else {
                XCTFail("\($0)")
                return
            }
            
            XCTAssertEqual(info.count, 1)
            XCTAssertEqual(info.start, 0)
            XCTAssertEqual(info.total, 250)
            XCTAssertEqual(info.title, "豆瓣电影Top250")
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
