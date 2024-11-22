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
        bindViewModel()
    }
    
    private func setupTableView() {
           tableView.frame = view.bounds
           tableView.delegate = self
           tableView.dataSource = self
           tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
           tableView.separatorStyle = .none
           view.addSubview(tableView)
       }
    
    private func bindViewModel() {
             viewModel.fetchNotifications()
             tableView.reloadData()
         }
    
    func numberOfSections(in tableView: UITableView) -> Int {
             return viewModel.likeNotifications.count
         }

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return viewModel.likeNotifications[section].notifications.count
         }

         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
             let notification = viewModel.likeNotifications[indexPath.section].notifications[indexPath.row]
             cell.configure(with: notification)
             return cell
         }

         func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
             return viewModel.likeNotifications[section].section
         }

         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 80
         }

         func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
             return 40
         }

}
