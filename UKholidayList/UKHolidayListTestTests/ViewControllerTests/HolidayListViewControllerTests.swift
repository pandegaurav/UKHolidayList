//
//  HolidayListViewControllerTests.swift
//  LloydsTest
//
//  Created by Gaurav pande on 09/02/23.
//

import XCTest
@testable import LloydsTest

final class HolidayListViewControllerTests: XCTestCase {
    var viewControllerUnderTest: HolidayListViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "HolidayListViewController") as? HolidayListViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    override func tearDown() {
        super.tearDown()
    }
    func test_ViewControllerIsComposedOfTabel() {
    XCTAssertNotNil(self.viewControllerUnderTest.tableView, "ViewController under test is not composed of a UILabel")
    }
    func test_ViewControllerTitle_Is_Same_As_DivisionName() {
        XCTAssertEqual(self.viewControllerUnderTest.navigationController?.title, self.viewControllerUnderTest.divisionName)
    }
}
