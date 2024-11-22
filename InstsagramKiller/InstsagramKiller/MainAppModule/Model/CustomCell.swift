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
    private let timestampLabel = UILabel()
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

        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.numberOfLines = 2
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        timestampLabel.font = UIFont.systemFont(ofSize: 12)
        timestampLabel.textColor = .gray
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false

        postImageView.contentMode = .scaleAspectFill
        postImageView.layer.cornerRadius = 8
        postImageView.clipsToBounds = true
        postImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(profileImageView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(timestampLabel)
        contentView.addSubview(postImageView)

        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),

            messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: postImageView.leadingAnchor, constant: -10),
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            timestampLabel.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor),
            timestampLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5),
            timestampLabel.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor),

            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: 40),
            postImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func configure(with item: NotificationItem) {
        profileImageView.image = UIImage(named: item.profileImage)
        messageLabel.text = item.message
        timestampLabel.text = item.timestamp
        if let postImage = item.postImage {
            postImageView.image = UIImage(named: postImage)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
}

