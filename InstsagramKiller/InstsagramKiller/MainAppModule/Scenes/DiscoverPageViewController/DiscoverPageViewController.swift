//
//  DiscoverPageViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit

class DiscoverPageViewController: UIViewController {
    private var collectionView = DiscoverPageCollectionView(frame: CGRect())
    private let viewModel = DiscoverPageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: BackgroundColors.accent.rawValue)
        setupCollectionView()
    }
    
    // MARK: - Setup Collection View
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
