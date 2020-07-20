//
//  TraficCameraLocationAPITest.swift
//  TrafficConditionTests
//
//  Created by stella on 7/20/20.
//  Copyright © 2020 Ishaq. All rights reserved.
//

import XCTest
@testable import TrafficCondition


class TraficCameraLocationAPITest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTraficCamerasLocationAPI()  {
        let e = expectation(description: "Trafic Cameras Lcoations API exception")
        
        // This will test mapper as well, if there is any issue with mapper request response will be nill
        TraficCameraLocationService().loadTraficCameraFeedForTimeStamp(timeStamp:Utilities().generateCurrentTimeStamp(date: Date()) )
        {( success , responseObject) -> Void in
            let traficCameras:[TraficCamera] = responseObject
            XCTAssert(success);
            XCTAssertNotNil(traficCameras, "Expected non-nil Trafic cameras location")
            e.fulfill()
        }
        wait(for: [e], timeout: 20)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
