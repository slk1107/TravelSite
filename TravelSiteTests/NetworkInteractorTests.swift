//
//  TravelSiteTests.swift
//  TravelSiteTests
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import XCTest
@testable import TravelSite

class NetworkInteractorTests: XCTestCase {
    
    var networkInteractor: NetworkInteractor!
    
    override func setUp() {
        networkInteractor = NetworkInteractor()
    }

    override func tearDown() {
    }

    func testFetchSite() {
        fetchSite()
    }
    
    func testFetchSiteBoundary() {
        fetchSite(index: -1)
        fetchSite(index: 2000)
    }
    
    func testFetchAll() {
        fetchSite(index: 0, pageCount: 1000)
    }
    
    private func fetchSite(index: Int = 0, pageCount: Int = 10) {
        let expectation = XCTestExpectation(description: "NetworkInteractor fetchSites")

        networkInteractor.fetchSites(from: index, pageCount: pageCount, completion: { response in
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
