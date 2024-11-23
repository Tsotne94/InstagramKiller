//
//  HomePageCell.swift
//  InstsagramKiller
//
//  Created by Beka on 23.11.24.
//

import UIKit

class HomePageCell: UITableViewCell {
    static let identifier = "HomePageCell"
    let profileIcon = UIImageView()
    let usernameLabel = UILabel()
    let userLocation = UILabel()
    let verificationIcon = UIImageView()
    let postImage = UIImageView()
    let postImageTwo = UIImageView()
    let favouritesIcon = UIButton()
    let commentIcon = UIButton()
    let shareIcon = UIButton()
    let likedMiniProfileIcon = UIImageView()
    let commentTextLabel = UILabel()
    let commentUserName = UILabel()
    let userCommentLabel = UILabel()
    let dateLabel = UILabel()
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layoutIfNeeded()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        setUpProfileIcon()
        setUpUserNameLabel()
        setupVerificationIcon()
        setUpUserLocation()
        setUpScrollView()
        setupFeedImage()
        setUpFavouritesIcon()
        setUpCommentIcon()
        setUpShareIcon()
        setUpCommentProfileIcon()
        setUpCommentTextlabel()
        setUpUserCommentLabel()
        setUpDateLabel()
    }
    
    private func setUpProfileIcon() {
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.layer.cornerRadius = 15
        profileIcon.clipsToBounds = true
        contentView.addSubview(profileIcon)
        NSLayoutConstraint.activate([
            profileIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            profileIcon.heightAnchor.constraint(equalToConstant: 32),
            profileIcon.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func setUpUserNameLabel() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.font = .systemFont(ofSize: 13, weight: .bold)
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: profileIcon.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: profileIcon.topAnchor),
            ])
    }
    
    private func setupVerificationIcon() {
        verificationIcon.image = .verificationIcon
        verificationIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verificationIcon)
        NSLayoutConstraint.activate([
            verificationIcon.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 5),
            verificationIcon.topAnchor.constraint(equalTo: profileIcon.topAnchor, constant: 2),
            verificationIcon.heightAnchor.constraint(equalToConstant: 10),
            verificationIcon.widthAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    private func setUpUserLocation() {
        userLocation.translatesAutoresizingMaskIntoConstraints = false
        userLocation.font = .systemFont(ofSize: 11)
        contentView.addSubview(userLocation)
        NSLayoutConstraint.activate([
            userLocation.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            userLocation.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            ])
    }
    
    private func setUpScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.backgroundColor = .red
        contentView.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 20),
            scrollView.heightAnchor.constraint(equalToConstant: 407),
            scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        
        scrollView.contentSize = CGSize(width: contentView.bounds.width * 2.5, height: 200)
    }
    
    private func setupFeedImage() {
        postImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(postImage)
        
        postImageTwo.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(postImageTwo)
        
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            postImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            postImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            postImageTwo.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postImageTwo.leftAnchor.constraint(equalTo: postImage.rightAnchor),
            postImageTwo.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            postImageTwo.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                ])
    }
    
    private func setUpFavouritesIcon() {
        favouritesIcon.setImage(UIImage(resource: .favouritesIcon), for: .normal)
        favouritesIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favouritesIcon)
        NSLayoutConstraint.activate([
            favouritesIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            favouritesIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
    }
    
    private func setUpCommentIcon() {
        commentIcon.setImage(UIImage(resource: .commentIcon), for: .normal)
        commentIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentIcon)
        NSLayoutConstraint.activate([
            commentIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            commentIcon.leadingAnchor.constraint(equalTo: favouritesIcon.trailingAnchor, constant: 15),
        ])
    }
    
    private func setUpShareIcon() {
        shareIcon.setImage(UIImage(resource: .shareIcon), for: .normal)
        shareIcon.translatesAutoresizingMaskIntoConstraints = false
        shareIcon.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        contentView.addSubview(shareIcon)
        NSLayoutConstraint.activate([
            shareIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            shareIcon.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 15),
        ])

    }
    
    private func setUpCommentProfileIcon() {
        likedMiniProfileIcon.layer.cornerRadius = 10
        likedMiniProfileIcon.clipsToBounds = true
        likedMiniProfileIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likedMiniProfileIcon)
        NSLayoutConstraint.activate([
            likedMiniProfileIcon.topAnchor.constraint(equalTo: favouritesIcon.bottomAnchor, constant: 15),
            likedMiniProfileIcon.leadingAnchor.constraint(equalTo: favouritesIcon.leadingAnchor),
            likedMiniProfileIcon.heightAnchor.constraint(equalToConstant: 20),
            likedMiniProfileIcon.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setUpCommentTextlabel() {
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentTextLabel)
        NSLayoutConstraint.activate([
            commentTextLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.trailingAnchor, constant: 15),
            commentTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            commentTextLabel.topAnchor.constraint(equalTo: favouritesIcon.bottomAnchor, constant: 15)
            ])
    }

    private func setUpUserCommentLabel() {
        userCommentLabel.translatesAutoresizingMaskIntoConstraints = false
        userCommentLabel.numberOfLines = 0
        contentView.addSubview(userCommentLabel)
        NSLayoutConstraint.activate([
            userCommentLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.leadingAnchor),
            userCommentLabel.topAnchor.constraint(equalTo: likedMiniProfileIcon.bottomAnchor, constant: 15),
            userCommentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
        private func setUpDateLabel() {
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(dateLabel)
            NSLayoutConstraint.activate([
                dateLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.leadingAnchor),
                dateLabel.topAnchor.constraint(equalTo: userCommentLabel.bottomAnchor, constant: 15),
                dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
                ])
        }
    
    func configure(profileIcon: URL?, usernameLabel: String, userLocation: String, postImage: URL?, likedMiniProfileIcon: URL?, commentTextLabel: String, userCommentLabel: String, dateLabel: String) {
        
        self.usernameLabel.text = usernameLabel
        self.userLocation.text = userLocation
        self.commentTextLabel.text = commentTextLabel
        self.userCommentLabel.text = userCommentLabel
        self.dateLabel.text = dateLabel
        loadImage(from: profileIcon, into: self.profileIcon)
        loadImage(from: postImage, into: self.postImage)
        loadImage(from: likedMiniProfileIcon, into: self.likedMiniProfileIcon)
    }
    
    func loadImage(from url: URL?, into imageView: UIImageView) {
        guard let url else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(named: "defaultImage")
                    }
                }
            }
            task.resume()
        }
    
        @objc func shareButtonTapped() {
            let text = "Check out this awesome content!"
            let image = UIImage(named: "exampleImage")
            
            let items: [Any] = [text, image].compactMap { $0 }
            
            let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
            
            activityViewController.excludedActivityTypes = [
                .addToReadingList, .airDrop, .assignToContact, .postToFacebook, .postToTwitter
            ]
            
            if let viewController = self.window?.rootViewController {
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        }
}
