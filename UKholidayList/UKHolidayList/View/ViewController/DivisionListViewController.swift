//
//  DivisionListViewController.swift
//  LloydsTest
//
//  Created by Gaurav pande on 08/02/23.
//

import UIKit

class DivisionListViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Variables
    lazy var viewModel = {
        DivisionViewModel()
    }()
    // MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDivisionList()
    }
    // MARK: - Custom Methods
    func getDivisionList() {
        viewModel.getDivisionList()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension DivisionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.divisionCellheight
    }
}

// MARK: - UITableViewDataSource

extension DivisionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.divisionCellModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.divisionCellID, for: indexPath)
        cell.textLabel?.text = viewModel.divisionCellModels[indexPath.row].divisionName
        return cell
    }
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
let holidayList = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.HolidayListVC) as? HolidayListViewController
        holidayList?.divisionName = viewModel.divisionCellModels[indexPath.row].divisionName
        self.navigationController?.pushViewController(holidayList, animated: true)
    }
}
