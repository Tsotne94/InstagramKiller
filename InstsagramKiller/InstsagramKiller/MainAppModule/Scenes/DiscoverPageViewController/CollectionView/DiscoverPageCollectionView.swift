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
    private let customLayout = DiscoverPageCollectionViewLayout() // Custom layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
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
    }

    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverPageCollectionViewCell.reuseIdentifier, for: indexPath) as! DiscoverPageCollectionViewCell
        
        let imageName = "i\(indexPath.item+1)"
        
        if let image = UIImage(named: imageName) {
            cell.setImage(image)
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
}

