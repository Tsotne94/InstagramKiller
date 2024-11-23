//
//  ViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//

import UIKit
import Foundation

class homePageViewController: UIViewController, UITableViewDataSource {
    
    let tableView = UITableView()
    var header = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        tableView.dataSource = self
    }
    
    private func setupTitle() {
        header.image = .instagramLogo
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomePageCell.self, forCellReuseIdentifier: HomePageCell.identifier)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCell.identifier, for: indexPath) as! HomePageCell
        cell.configure(profileIcon: .init(string: "https://picsum.photos/200/300"), usernameLabel: "Joshua l", userLocation: "Tokyo, Japan", postImage: .init(string: "https://picsum.photos/200/300"), likedMiniProfileIcon: .init(string: "https://picsum.photos/200/300"), commentTextLabel: "Liked By", userCommentLabel: "joshua_l The game in Japan was amazing i want to share some photos", dateLabel: "September 19")
        return cell
    }
}
