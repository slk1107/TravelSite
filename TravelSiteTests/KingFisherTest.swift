//
//  KingFisherTest.swift
//  TravelSiteTests
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import XCTest
import Kingfisher
class KingFisherTest: XCTestCase {
    var httpsTestImageUrl: URL!
    var httpTestImageUrl: URL!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        httpsTestImageUrl = URL(string: "https://www.travel.taipei/d_upload_ttn/sceneadmin/pic/11000840.jpg")
        
        httpTestImageUrl = URL(string: "http://www.travel.taipei/d_upload_ttn/sceneadmin/image/A0/B0/C0/D727/E874/F732/1f40db60-ded0-416a-976e-baeea0464d8e.jpg")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadImage() {
        testLoadImage(url: httpTestImageUrl)
        testLoadImage(url: httpsTestImageUrl)
    }
    
    private func testLoadImage(url: URL) {
        asyncTest(expectationName: "Download king fisher") { expectation in
            let imageview = UIImageView()
            imageview.kf.setImage(with: url, options: [.keepCurrentImageWhileLoading]) {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    assert(imageview.image != nil)
                    expectation.fulfill()
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                    assert(false)
                    expectation.fulfill()
                }
            }
        }
    }
    
    func testRetrieveImage() {
        asyncTest(expectationName: "Retrive through kingFisher") {
            expectation in
            KingfisherManager.shared.retrieveImage(with: httpTestImageUrl) { result in
                // Do something with `result`
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    expectation.fulfill()
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                    expectation.fulfill()
                }
                expectation.fulfill()
            }
        }
    }
    
    private func asyncTest(expectationName: String, runnable: (XCTestExpectation) -> ()) {
        let expectation = XCTestExpectation(description: expectationName)
        runnable(expectation)
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
