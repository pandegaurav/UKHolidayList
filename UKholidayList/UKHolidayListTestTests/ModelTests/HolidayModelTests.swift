//
//  HolidayModelTests.swift
//  LloydsTest
//
//  Created by Gaurav pande on 09/02/23.
//

import XCTest

//@testable import UKHolidayListTracker

final class HolidayModelTests: XCTestCase {
    func testInit() {
        let testSuccessfulJSON: JSON = ["title": "Spring bank holiday",
                                        "date": "2021-05-31",
                                        "notes": "",
                                        "bunting": true]
        XCTAssertNotNil(HolidayCellModel(json: testSuccessfulJSON))
    }
}

private extension HolidayCellModel {
    init?(json: JSON) {
        guard let title = json["title"] as? String,
              let date = json["date"] as? String,
              let notes = json["notes"] as? String,
              let bunting = json["bunting"] as? Bool else {
            return nil
        }
        self.title = title
        self.date = date
        self.notes = notes
        self.bunting = bunting
    }
}
