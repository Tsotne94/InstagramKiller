//
//  NotificationsViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let viewModel = NotificationsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
           tableView.frame = view.bounds
           tableView.delegate = self
           tableView.dataSource = self
           tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
           tableView.separatorStyle = .none
           view.addSubview(tableView)
       }
    

}
