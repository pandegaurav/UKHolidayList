//
//  HolidayListViewController.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import UIKit

class HolidayListViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var tableView: UITableView!
    // MARK: - Variables
    lazy var viewModel = {
        HolidayViewModel()
    }()
    var divisionName: String?
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    // MARK: - Custom Methods
    func intialSetup() {
        self.title = divisionName
        initTableViewCell()
        getHolidayList()
    }
    func initTableViewCell() {
        tableView.register(HolidayTableViewCell.nib, forCellReuseIdentifier: HolidayTableViewCell.identifier)
    }
    // Fetch list of holidays as per the Division
    func getHolidayList() {
        viewModel.getHolidaysList(division: divisionName ?? "") { response in
            if response {
            } else {
                self.viewModel.loadDatafromMock(division: self.divisionName ?? "")
            }
        }
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
