//
//  DiscoverPageCollectionViewLayout.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit

class DiscoverPageCollectionViewLayout: UICollectionViewCompositionalLayout {
    
    init() {
        super.init(sectionProvider: DiscoverPageCollectionViewLayout.createLayoutSection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static private func createLayoutSection(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        
        func createSquareItem() -> NSCollectionLayoutItem {
            let square = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2),
                    heightDimension: .fractionalHeight(1)
                )
            )
            square.contentInsets = .init(top: 0, leading: 0, bottom: 1, trailing: 1)
            return square
        }
        
        let tallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let squareItem = createSquareItem()
        
        let squarePairGroup = { () -> NSCollectionLayoutGroup in
            return NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1/2)
                ),
                subitems: [squareItem, squareItem]
            )
        }
        
        let squareGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [squarePairGroup(), squarePairGroup()]
        )
        
        let sectionGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ),
            subitems: [squareGroup, tallItem]
        )
        
        let section = NSCollectionLayoutSection(group: sectionGroup)
        return section
    }
}
