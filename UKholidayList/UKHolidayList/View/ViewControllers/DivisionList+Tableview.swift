//
//  DivisionList+Tableview.swift
//  LloydsTest
//
//  Created by Gaurav pande on 09/02/23.
//

import Foundation
import UIKit

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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let holidayVC = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.HolidayListVC) as? HolidayListViewController
        holidayVC?.divisionName = viewModel.divisionCellModels[indexPath.row].divisionName
        self.navigationController?.pushViewController(holidayVC ?? HolidayListViewController(), animated: true)
    }
}
