//
//  ViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//

import UIKit
import Foundation

class homePageViewController: UIViewController, UITableViewDataSource {
    
    let viewModel = HomePageViewModel()
    let tableView = UITableView()
    var header = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: BackgroundColors.accent.rawValue)
        setupTitle()
        setupTableView()
        tableView.dataSource = self
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func fetchData() {
        viewModel.getPosts { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTitle() {
        header.image = .instagramLogo
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
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
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCell.identifier, for: indexPath) as! HomePageCell
        cell.configure(with: model, at: indexPath.row)
        return cell
    }
}
