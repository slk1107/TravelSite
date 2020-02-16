//
//  TravelSiteTests.swift
//  TravelSiteTests
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import XCTest
@testable import TravelSite

class TravelSiteTests: XCTestCase {
    
    var networkInteractor: NetworkInteractor!
    
    override func setUp() {
        networkInteractor = NetworkInteractor()
    }

    override func tearDown() {
    }

    func testFetchSite() {
        let expectation = XCTestExpectation(description: "NetworkInteractor fetchSites")

        networkInteractor.fetchSites(completion: { response in
            print(response as Any)
            assert(response != nil)
            expectation.fulfill()
        }, error: { error in
            assert(false, "fetchSites faile: \(error.localizedDescription)")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
