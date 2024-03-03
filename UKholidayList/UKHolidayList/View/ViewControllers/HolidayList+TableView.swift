//
//  HolidayList+TableView.swift
//  LloydsTest
//
//  Created by Gaurav pande on 09/02/23.
//

import Foundation
import UIKit

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
