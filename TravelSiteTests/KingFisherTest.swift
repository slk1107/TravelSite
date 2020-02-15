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
    var testImageUrl: URL!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testImageUrl = URL(string: "https://www.travel.taipei/d_upload_ttn/sceneadmin/pic/11000840.jpg")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadImage() {
        let expectation = XCTestExpectation(description: "Download king fisher")
        let imageview = UIImageView()
        imageview.kf.setImage(with: testImageUrl, options: [.keepCurrentImageWhileLoading]) {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
                assert(imageview.image != nil)
                expectation.fulfill()
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
                assert(imageview.image == nil)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
