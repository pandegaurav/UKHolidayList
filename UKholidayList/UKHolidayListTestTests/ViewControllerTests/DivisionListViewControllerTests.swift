//
//  DivisionListViewControllerTests.swift
//  LloydsTestTests
//
//  Created by Gaurav pande on 09/02/23.
//

import XCTest
@testable import LloydsTest

final class DivisionListViewControllerTests: XCTestCase {
    var viewControllerUnderTest: DivisionListViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "DivisionListViewController") as? DivisionListViewController
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewControllerIsComposedOfTabel() {
    XCTAssertNotNil(self.viewControllerUnderTest.tableView, "ViewController under test is not composed of a UILabel")
    }
}
