//
//  FeedCollectionViewCell.swift
//  InstsagramKiller
//
//  Created by Gio Kakaladze on 23.11.24.
//
import UIKit

class FeedCollectionViewCell: UITableViewCell {

    static let identifier = "FeedCollectionViewCell"
    
    private var images: [UIImage] = []
    
    private let FeedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(FeedImageView)
        
        NSLayoutConstraint.activate([
            FeedImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            FeedImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            FeedImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            FeedImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            FeedImageView.widthAnchor.constraint(equalToConstant: 124),
            FeedImageView.widthAnchor.constraint(equalToConstant: 139),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError(":(")
    }

    func configure(with images: [UIImage]) {
        self.images = images
    }
}


