//
//  CustomCell.swift
//  InstsagramKiller
//
//  Created by Sandro Tsitskishvili on 22.11.24.
//
import UIKit

class CustomCell: UITableViewCell {
    private let profileImageView = UIImageView()
    private let messageLabel = UILabel()
    private let postImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        postImageView.contentMode = .scaleAspectFill
        postImageView.layer.cornerRadius = 8
        postImageView.clipsToBounds = true
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: -10),
            messageLabel.heightAnchor.constraint(equalToConstant: 50),
            messageLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
           
            
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: 40),
            postImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(with item: NotificationItem) {
        if let url = URL(string: item.profileImage) {
            loadImage(from: url)
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }
        let boldUsername = NSAttributedString(
            string: item.username,
            attributes: [.font: UIFont.boldSystemFont(ofSize: 13) ]
        )
        let regularAction = NSAttributedString(
            string: " \(item.action)",
            attributes: [.font: UIFont.systemFont(ofSize: 13) ]
        )
        let regularTimestamp = NSAttributedString(
            string: " \n \(item.timestamp)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 13),
                .foregroundColor: UIColor.gray
            ]
        )
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(boldUsername)
        attributedText.append(regularAction)
        attributedText.append(regularTimestamp)
        
        messageLabel.attributedText = attributedText
        
        if let postImage = item.postImage {
            postImageView.image = UIImage(named: postImage)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error loading profile image: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Error: Unable to convert data to image.")
                return
            }
            
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            }
        }.resume()
    }
}


