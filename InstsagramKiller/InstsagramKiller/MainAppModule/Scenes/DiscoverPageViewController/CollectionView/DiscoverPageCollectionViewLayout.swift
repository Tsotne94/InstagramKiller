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
        let firstSquarePairGroup = createSquareItemHorisontalPair(from: createSquareItem(), and: createSquareItem())
        let secondSquarePairGroup = createSquareItemHorisontalPair(from: createSquareItem(), and: createSquareItem())
        let squareGroup = createSquareItemVerticalPair(from: firstSquarePairGroup, and: secondSquarePairGroup)
        
        
        let tallItemLastGroup = createSquareItemHorisontalPair(from: squareGroup, and: createTallItem())
        let tallItemFirstGroup = createSquareItemHorisontalPair(from: createTallItem(), and: squareGroup)
        
        let finalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/3)
            ),
            subitems: [tallItemLastGroup, tallItemFirstGroup]
        )
        
        let section = NSCollectionLayoutSection(group: finalGroup)
        return section
    }
    
    private static func createTallItem() -> NSCollectionLayoutItem {
        let tallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(0.997)
            )
        )
        return tallItem
    }
    
    private static func createSquareItem() -> NSCollectionLayoutItem {
        let square = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(0.997)
            )
        )
        return square
    }
    
    private static func createSquareItemHorisontalPair(from firstitem: NSCollectionLayoutItem, and secondItem: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        firstitem.contentInsets = .init(top: 0, leading: 0, bottom: 0.5, trailing: 0.5)
        secondItem.contentInsets = .init(top: 0, leading: 0.5, bottom: 0.5, trailing: 0)
        let squarePairGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            ),
            subitems: [firstitem, secondItem]
        )
        return squarePairGroup
    }
    
    private static func createSquareItemVerticalPair(from firstitem: NSCollectionLayoutItem, and secondItem: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        let squareGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [firstitem, secondItem]
        )
        return squareGroup
    }
}
