//
//  HolidayServiceTests.swift
//  LloydsTest
//
//  Created by Gaurav pande on 09/02/23.
//

import XCTest

final class HolidayServiceTests: XCTestCase {
    func testHolidayAPI() {
               let expectation = self.expectation(description: " API should work")
               HttpHelper().GET(url: Constants.BaseURL, params: ["": ""], httpHeader: .applicationjson) { success, data in
                   if success {
                       XCTAssertTrue(true)
                   } else {
                       XCTFail("Fail")
                   }
                   expectation.fulfill()
               }
                self.waitForExpectations(timeout: 20, handler: nil)
           }

}
