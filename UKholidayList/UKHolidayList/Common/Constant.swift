//
//  Constant.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import Foundation

 struct Constants {
     static let holidayCellheight = 90.0
     static let divisionCellheight = 50.0
     static let BaseURL = "https://www.gov.uk/bank-holidays.json"
     static let errorTitle = "Error"
     static let errorMessage = "Unable to fetch data from server do you want to fetch from local"
     static let okButtonTitle = "Load from Stub"
     static let cancelButtonTitle = "Cancel"
     
     
}

struct CellIdentifiers {
static let divisionCellID = "divisionCell"
}

struct ViewControllerIdentifiers {
    static let HolidayListVC = "HolidayListViewController"
}
