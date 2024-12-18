//
//  DiscoverPageCollectionViewCell.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
import UIKit

final class DiscoverPageCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func prepareForReuse() {
        imageView.image = nil
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }
}
