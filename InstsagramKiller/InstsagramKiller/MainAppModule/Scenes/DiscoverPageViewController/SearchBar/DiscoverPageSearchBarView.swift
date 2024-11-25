//
//  DiscoverPageSearchBarView.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 23.11.24.
//

import UIKit

class DiscoverPageSearchBarView: UICollectionReusableView, ReuseIdentifying {
    var searchBar: UISearchBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
    
    func setDelegate(_ delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
