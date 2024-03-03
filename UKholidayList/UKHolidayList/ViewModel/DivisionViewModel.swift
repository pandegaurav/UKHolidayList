//
//  DivisionViewModel.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import Foundation

class DivisionViewModel: NSObject {
    // MARK: - Variables
    private var holidayService: DivisionProtocol
    var reloadTableView: (() -> Void)?
    var divisionCellModels = [DivisionCellModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(holidayService: DivisionProtocol = HolidayService()) {
        self.holidayService = holidayService
    }
    // Get Division list inside UK
    func getDivisionList  (completion: @escaping (Bool) -> ()) {
        holidayService.getDivisionList { success, arr, error in
            if success {
                var divisionData = [DivisionCellModel]()
                for division in arr {
                    let divisionCellModel = DivisionCellModel(divisionName: division)
                    divisionData.append(divisionCellModel)
                }
                self.divisionCellModels = divisionData
                completion(true)
            } else {
                print(error!)
                completion(false)
            }
        }
    }
    func loadDatafromMock() {
        if let path = Bundle.main.path(forResource: "Mock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    var keyArray: Array = [String]()
                    for obj in jsonResult.keys {
                        keyArray.append(obj.description)
                    }
                    var divisionData = [DivisionCellModel]()
                    for division in keyArray {
                        let divisionCellModel = DivisionCellModel(divisionName: division)
                        divisionData.append(divisionCellModel)
                    }
                    self.divisionCellModels = divisionData
                }
            } catch {
                print(error)
            }
        }
    }
}
