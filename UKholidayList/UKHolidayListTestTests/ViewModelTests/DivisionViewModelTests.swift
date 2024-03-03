//
//  DivisionViewModelTests.swift
//  LloydsTestTests
//
//  Created by Gaurav pande on 09/02/23.
//

import XCTest

final class DivisionViewModelTests: XCTestCase {
    
    var viewModel: DivisionViewModel!
    fileprivate var service: HolidayService!
    
    override func setUp() {
        super.setUp()
        self.service = HolidayService()
        self.viewModel = DivisionViewModel(holidayService: self.service)
    }
    override func tearDown() {
        self.viewModel = nil
        self.service = nil
        super.tearDown()
    }
    func testInitialization() {
        let holidayViewModel = DivisionViewModel(holidayService: self.service)
        XCTAssertNotNil(holidayViewModel, "The division view model should not be nil.")
    }
    func test_getDivisionList() {
        let expectation = self.expectation(description: "Division List Should be fetched ")
        self.service.getDivisionList { success, model, error in
            if success {
                XCTAssertTrue(true)
            } else {
                XCTFail("Fail")
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 20, handler: nil)
    }
    
    func test_loadDatafromMock(){
        viewModel.loadDatafromMock()
        XCTAssertNotNil(viewModel.divisionCellModels)
        
    }
}
