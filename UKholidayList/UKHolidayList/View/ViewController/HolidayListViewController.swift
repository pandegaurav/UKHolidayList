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
        viewModel.getHolidaysList(division: divisionName ?? "")
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension HolidayListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.holidayCellheight
    }
}

// MARK: - UITableViewDataSource

extension HolidayListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.holidayCellModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
guard let cell = tableView.dequeueReusableCell(withIdentifier: HolidayTableViewCell.identifier, for: indexPath) as? HolidayTableViewCell else { fatalError("No XIB found") }
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
    }
}
