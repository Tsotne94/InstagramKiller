//
//  DiscoverPageCollectionView.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit
import Foundation

class DiscoverPageCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView!
    private let customLayout = DiscoverPageCollectionViewLayout()
    
    let imageNames = (1...21).map { "i\($0)" }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: customLayout)
        collectionView.backgroundColor = .white
        
        collectionView.register(DiscoverPageCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverPageCollectionViewCell.reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        collectionView.register(DiscoverPageSearchBarView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscoverPageSearchBarView.reuseIdentifier
        )
    }

    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverPageCollectionViewCell.reuseIdentifier, for: indexPath) as! DiscoverPageCollectionViewCell
        
        if let image = UIImage(named: imageNames[indexPath.item]) {
            cell.setImage(image)
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DiscoverPageSearchBarView.reuseIdentifier , for: indexPath) as! DiscoverPageSearchBarView
        searchView.delegate = self
        return searchView
    }
}

extension DiscoverPageCollectionView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("Search text: \(searchText)")
    }
}
























