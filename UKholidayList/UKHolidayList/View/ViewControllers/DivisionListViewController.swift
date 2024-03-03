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
        viewModel.getDivisionList { response in
            if response {
                print("YES")
            } else {
                DispatchQueue.main.async {
                    self.showErrorAlert()
                }
            }
        }
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: Constants.errorTitle, message: Constants.errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        errorAlert.addAction(UIAlertAction(title: Constants.okButtonTitle, style: .default, handler: { (action: UIAlertAction!) in
            self.viewModel.loadDatafromMock()
        }))
        
        errorAlert.addAction(UIAlertAction(title: Constants.cancelButtonTitle, style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        present(errorAlert, animated: true, completion: nil)
    }
}
