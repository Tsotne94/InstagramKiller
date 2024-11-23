//
//  HomePageCell.swift
//  InstsagramKiller
//
//  Created by Beka on 23.11.24.
//

import UIKit

class HomePageCell: UITableViewCell, UIScrollViewDelegate {
    static let identifier = "HomePageCell"
    
    private let profileIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .bold)
        
        return label
    }()
    
    private let userLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11)
        
        return label
    }()
    
    private let verificationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .verificationIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let postImageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let favouritesIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .favouritesIcon), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let commentIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .commentIcon), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let shareIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: .shareIcon), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let likedMiniProfileIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let commentTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let commentUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let userCommentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.backgroundColor = .red
        
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 2
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(named: BackgroundColors.blueButton.rawValue)
        
        return pageControl
    }()
    
    private let andOthersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let likedByUsernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
        setupPageControl()
    }
    
    private func setUpProfileIcon() {
        contentView.addSubview(profileIcon)
        NSLayoutConstraint.activate([
            profileIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            profileIcon.heightAnchor.constraint(equalToConstant: 32),
            profileIcon.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func setUpUserNameLabel() {
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: profileIcon.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: profileIcon.topAnchor),
        ])
    }
    
    private func setupVerificationIcon() {
        contentView.addSubview(verificationIcon)
        NSLayoutConstraint.activate([
            verificationIcon.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 5),
            verificationIcon.topAnchor.constraint(equalTo: profileIcon.topAnchor, constant: 2),
            verificationIcon.heightAnchor.constraint(equalToConstant: 10),
            verificationIcon.widthAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    private func setUpUserLocation() {
        contentView.addSubview(userLocation)
        NSLayoutConstraint.activate([
            userLocation.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            userLocation.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
        ])
    }
    
    private func setUpScrollView() {
        contentView.addSubview(scrollView)
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 20),
            scrollView.heightAnchor.constraint(equalToConstant: 407),
            scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        
            scrollView.layoutIfNeeded()
            scrollView.contentSize = CGSize(width: scrollView.bounds.width * 2.6, height: scrollView.bounds.height)

    }
    
    private func setupFeedImage() {
        scrollView.addSubview(postImage)
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
        contentView.addSubview(favouritesIcon)
        NSLayoutConstraint.activate([
            favouritesIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            favouritesIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
    }
    
    private func setUpCommentIcon() {
        contentView.addSubview(commentIcon)
        NSLayoutConstraint.activate([
            commentIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            commentIcon.leadingAnchor.constraint(equalTo: favouritesIcon.trailingAnchor, constant: 15),
        ])
    }
    
    private func setUpShareIcon() {
        contentView.addSubview(shareIcon)
        shareIcon.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            shareIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            shareIcon.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 15),
        ])
        
    }
    
    private func setUpCommentProfileIcon() {
        contentView.addSubview(likedMiniProfileIcon)
        NSLayoutConstraint.activate([
            likedMiniProfileIcon.topAnchor.constraint(equalTo: favouritesIcon.bottomAnchor, constant: 15),
            likedMiniProfileIcon.leadingAnchor.constraint(equalTo: favouritesIcon.leadingAnchor),
            likedMiniProfileIcon.heightAnchor.constraint(equalToConstant: 20),
            likedMiniProfileIcon.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setUpCommentTextlabel() {
        contentView.addSubview(commentTextLabel)
        NSLayoutConstraint.activate([
            commentTextLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.trailingAnchor, constant: 15),
            commentTextLabel.topAnchor.constraint(equalTo: favouritesIcon.bottomAnchor, constant: 15)
        ])
        contentView.addSubview(likedByUsernameLabel)
        NSLayoutConstraint.activate([
            likedByUsernameLabel.leadingAnchor.constraint(equalTo: commentTextLabel.trailingAnchor, constant: 5),
            likedByUsernameLabel.centerYAnchor.constraint(equalTo: commentTextLabel.centerYAnchor)
        ])
        
        contentView.addSubview(andOthersLabel)
        NSLayoutConstraint.activate([
            andOthersLabel.leadingAnchor.constraint(equalTo: likedByUsernameLabel.trailingAnchor, constant: 5),
            andOthersLabel.centerYAnchor.constraint(equalTo: commentTextLabel.centerYAnchor),
            andOthersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
    }
    
    private func setUpUserCommentLabel() {
        contentView.addSubview(userCommentLabel)
        NSLayoutConstraint.activate([
            userCommentLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.leadingAnchor),
            userCommentLabel.topAnchor.constraint(equalTo: likedMiniProfileIcon.bottomAnchor, constant: 15),
            userCommentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setUpDateLabel() {
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: userCommentLabel.bottomAnchor, constant: 15),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupPageControl() {
        contentView.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerYAnchor.constraint(equalTo: shareIcon.centerYAnchor)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = Int(round(scrollView.contentOffset.x / pageWidth))
        pageControl.currentPage = page
    }

//    func configureLikedBy(with like: Likes, othersCount: Int) {
//        commentUserName.text = "Liked by"
//        likedByUsernameLabel.text = like.username
//        andOthersLabel.text = "and \(othersCount) others"
//
//        if let url = URL(string: like.profilePictureURL) {
//            loadImage(from: url, into: profileIcon)
//        } else {
//            profileIcon.image = UIImage(named: "defaultImage")
//        }
//    }
}
