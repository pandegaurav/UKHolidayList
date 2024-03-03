//
//  HolidayViewModelTests.swift
//  LloydsTestTests
//
//  Created by Gaurav pande on 08/02/23.
//

import XCTest

@testable import LloydsTest

final class HolidayViewModelTests: XCTestCase {
    var viewModel: HolidayViewModel!
    fileprivate var service: HolidayService!
    override func setUp() {
        super.setUp()
        self.service = HolidayService()
        self.viewModel = HolidayViewModel(holidayService: self.service)
    }
    override func tearDown() {
        self.viewModel = nil
        self.service = nil
        super.tearDown()
    }
    func testInitialization() {
        let holidayViewModel = HolidayViewModel(holidayService: self.service)
        XCTAssertNotNil(holidayViewModel, "The holiday view model should not be nil.")
    }
    func test_getHolidaysList() {
        let expectation = self.expectation(description: "Holiday List Should be fetched ")
        self.service.getHolidayList { success, model, error in
            if success {
                XCTAssertTrue(true)
            } else {
                XCTFail("Fail")
            }
            expectation.fulfill()
        }
         self.waitForExpectations(timeout: 20, handler: nil)
    }
    func test_CreateCellModel() {
        let event = Event(title: "Christmas Day", date: "2021-12-27", notes: Notes.empty, bunting: true)
        let holidayCellModel = viewModel.createCellModel(event: event)
        XCTAssertNotNil(holidayCellModel)

    }
    
    func test_loadDatafromMock(){
        viewModel.loadDatafromMock(division: "england-and-wales")
        XCTAssertNotNil(viewModel.holidayCellModels)
        
    }
 
}
