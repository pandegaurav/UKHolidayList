//
//  HolidayViewModel.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import Foundation

class HolidayViewModel: NSObject {
    // MARK: - Variables
    private var holidayService: HolidayServiceProtocol
    var reloadTableView: (() -> Void)?
    var holidayCellModels = [HolidayCellModel]() {
        didSet {
            reloadTableView?()
        }
    }
    init(holidayService: HolidayServiceProtocol = HolidayService()) {
        self.holidayService = holidayService
    }
    // Get holiday list of Specific division of UK
    func getHolidaysList(division: String, completion: @escaping ((Bool) -> ())) {
        holidayService.getHolidayList { success, model, error in
            if success, let holidays = model {
                self.fetchData(holidays: holidays, division: division)
                completion(true)
            } else {
                print(error!)
                completion(false)
            }
        }
    }
    func loadDatafromMock(division: String) {
        if let path = Bundle.main.path(forResource: "Mock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let model = try JSONDecoder().decode(Holiday.self, from: data)
                self.fetchData(holidays: model, division: division)
            } catch {
                print(error)
            }
        } else {
        }
    }
    func fetchData(holidays: Holiday, division: String) {
        var holidayData = [HolidayCellModel]()
        switch division {
        case Holiday.CodingKeys.scotland.rawValue:
            for holiday in holidays.scotland.events {
                holidayData.append(createCellModel(event: holiday))
            }
        case  Holiday.CodingKeys.northernIreland.rawValue:
            for holiday in holidays.northernIreland.events {
                holidayData.append(createCellModel(event: holiday))
            }
        case Holiday.CodingKeys.englandAndWales.rawValue:
            for holiday in holidays.englandAndWales.events {
                holidayData.append(createCellModel(event: holiday))
            }
        default:
            print("")
        }
        holidayCellModels = holidayData
    }
    func createCellModel(event: Event) -> HolidayCellModel {
        let title   = event.title
        let date    = event.date
        let notes   = event.notes
        let bunting = event.bunting
        return HolidayCellModel(title: title, date: date, notes: notes.rawValue, bunting: bunting)
    }
    func getCellViewModel(at indexPath: IndexPath) -> HolidayCellModel {
        return holidayCellModels[indexPath.row]
    }
}
