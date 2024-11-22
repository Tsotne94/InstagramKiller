//
//  DiscoverPageCollectionViewCell.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit

class DiscoverPageCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView?
    
    override func prepareForReuse() {
        imageView?.image = nil
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: self.contentView.bounds)
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        self.contentView.addSubview(imageView ?? UIImageView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage) {
        imageView?.image = image
    }
}
