//
//  ProfileViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit

class ProfileDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileDetailsCell.self, forCellReuseIdentifier: ProfileDetailsCell.identifier)
        tableView.register(FeedCollectionViewCell.self, forCellReuseIdentifier: FeedCollectionViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var feedImages: [UIImage] = {
        return (1...13).compactMap { UIImage(named: "image\($0)") }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupTableView()
        view.backgroundColor = .white
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailsCell.identifier, for: indexPath) as! ProfileDetailsCell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
            cell.configure(with: feedImages)
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
}
