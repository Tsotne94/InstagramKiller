//
//  HomePageCell.swift
//  InstsagramKiller
//
//  Created by Beka on 23.11.24.
//

import UIKit

class HomePageCell: UITableViewCell, UIScrollViewDelegate {
    let cacheManager = ImageCacheManager.shared
    let buttonsViewModel = InteractiveButtonsViewModel()
    let homePageViewModel = HomePageViewModel()
    
    private var post: Post?
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
        label.font = UIFont(name: IGFonts.sfSemiBold.rawValue, size: 13)
        
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
    
    private let postImageThree: UIImageView = {
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
        label.textColor = .gray
        
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(named: BackgroundColors.blueButton.rawValue)
        
        return pageControl
    }()
    
    private let imagePageCount: PaddedLabel = {
        let label = PaddedLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1/3"
        label.backgroundColor = .darkGray
        label.textColor = .white
        return label
    }()
    
    private let andOthersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likedByLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Liked by "

        return label
    }()
    
    private let likedByUsernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: IGFonts.sfSemiBold.rawValue, size: 17)
        return label
    }()
    
    private let likedByAnd: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " and"
        return label
    }()
    
    private let likedByCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: IGFonts.sfSemiBold.rawValue, size: 17)

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
        setUpCommentTextLabel()
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
        contentView.addSubview(imagePageCount)
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 20),
            scrollView.heightAnchor.constraint(equalToConstant: 407),
            scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imagePageCount.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            imagePageCount.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16)
        ])
        
            scrollView.layoutIfNeeded()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: scrollView.bounds.height)

    }
    
    private func setupFeedImage() {
        scrollView.addSubview(postImage)
        scrollView.addSubview(postImageTwo)
        scrollView.addSubview(postImageThree)
        
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            postImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            postImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            postImageTwo.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postImageTwo.leftAnchor.constraint(equalTo: postImage.rightAnchor),
            postImageTwo.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            postImageTwo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            postImageThree.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postImageThree.leadingAnchor.constraint(equalTo: postImageTwo.trailingAnchor),
            postImageThree.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            postImageThree.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setUpFavouritesIcon() {
        contentView.addSubview(favouritesIcon)
        favouritesIcon.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            favouritesIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            favouritesIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            favouritesIcon.heightAnchor.constraint(equalToConstant: 23)
        ])
    }
    
    private func setUpCommentIcon() {
        contentView.addSubview(commentIcon)
        NSLayoutConstraint.activate([
            commentIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            commentIcon.leadingAnchor.constraint(equalTo: favouritesIcon.trailingAnchor, constant: 15),
            commentIcon.heightAnchor.constraint(equalTo: favouritesIcon.heightAnchor)
        ])
    }
    
    private func setUpShareIcon() {
        contentView.addSubview(shareIcon)
        shareIcon.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            shareIcon.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15),
            shareIcon.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 15),
            shareIcon.heightAnchor.constraint(equalTo: favouritesIcon.heightAnchor)
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
    
    private func setUpCommentTextLabel() {
        contentView.addSubview(likedByLabel)
        contentView.addSubview(likedByUsernameLabel)
        contentView.addSubview(likedByAnd)
        contentView.addSubview(likedByCount)
        contentView.addSubview(andOthersLabel)
        
        NSLayoutConstraint.activate([
            likedByLabel.leadingAnchor.constraint(equalTo: likedMiniProfileIcon.trailingAnchor, constant: 5),
            likedByLabel.centerYAnchor.constraint(equalTo: likedMiniProfileIcon.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likedByUsernameLabel.leadingAnchor.constraint(equalTo: likedByLabel.trailingAnchor),
            likedByUsernameLabel.centerYAnchor.constraint(equalTo: likedByLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likedByAnd.leadingAnchor.constraint(equalTo: likedByUsernameLabel.trailingAnchor),
            likedByAnd.centerYAnchor.constraint(equalTo: likedByUsernameLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likedByCount.leadingAnchor.constraint(equalTo: likedByAnd.trailingAnchor),
            likedByCount.centerYAnchor.constraint(equalTo: likedByAnd.centerYAnchor)
        ])
        
        likedByLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        likedByLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        likedByLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        likedByLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        andOthersLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        andOthersLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
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
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            dateLabel.topAnchor.constraint(equalTo: userCommentLabel.bottomAnchor, constant: 15),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        dateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func setupPageControl() {
        contentView.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerYAnchor.constraint(equalTo: shareIcon.centerYAnchor)
        ])
    }
    
    func configure(with post: Post, at index: Int) {
        self.usernameLabel.text = post.user?.username
        self.userLocation.text = post.location.name
        self.likedByUsernameLabel.text = post.likes?.data.first?.full_name
        self.likedByCount.text = " \(post.likes?.count ?? 0) others"
        self.userCommentLabel.text = post.comments.data.first?.text
        self.dateLabel.text = post.created_time?.toDayMonthFormat
        loadImage(from: post.user?.profile_picture, into: self.profileIcon)
        loadImage(from: post.images?.imageURLs.first ?? nil, into: self.postImage)
        loadImage(from: post.images?.imageURLs[1], into: self.postImageTwo)
        loadImage(from: post.images?.imageURLs[2], into: self.postImageThree)
        loadImage(from: post.likes?.data.first?.profile_picture, into: self.likedMiniProfileIcon)
        
        favouritesIcon.tag = index
    }
    
    func loadImage(from stringUrl: String?, into imageView: UIImageView) {
        guard !checkIfCached(on: stringUrl, into: imageView) else { return }
        guard let stringURL = stringUrl, let url = URL(string: stringURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, error == nil {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageView.image = image
                }
                self?.cacheManager.cacheImage(image, for: stringUrl)
            } else {
                DispatchQueue.main.async {
                    imageView.image = UIImage(named: "defaultImage")
                }
            }
        }
        task.resume()
    }
    
    func checkIfCached(on url: String?, into imageView: UIImageView) -> Bool {
        guard let url, let image = cacheManager.getImage(for: url) else { return false }
        DispatchQueue.main.async {
            imageView.image = image
        }
        return true
    }
    
    @objc func shareButtonTapped() {
        let image = getCurrentImage()
        buttonsViewModel.shareButtonTapped(image: image, window: self.window)
    }
    
    @objc func favoritesButtonTapped(_ sender: UIButton) {
        let itemID = sender.tag
        buttonsViewModel.toggleLike(for: itemID, button: sender)
    }
    
    private func getCurrentImage() -> UIImage? {
        if pageControl.currentPage == 0 {
            return self.postImage.image
        } else if pageControl.currentPage == 1 {
            return self.postImageTwo.image
        } else if pageControl.currentPage == 2 {
            return self.postImageThree.image
        }
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = Int(round(scrollView.contentOffset.x / pageWidth))
        pageControl.currentPage = page
        
        imagePageCount.text = "\(page + 1)/3"
    }
}

extension String {
    var toDayMonthFormat: String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = inputDateFormatter.date(from: self) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "d MMMM"
            
            return outputDateFormatter.string(from: date)
        }
        return nil
    }
}

class PaddedLabel: UILabel {
    
    var padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override func drawText(in rect: CGRect) {
        let paddedRect = rect.inset(by: padding)
        layer.cornerRadius = 16
        clipsToBounds = true
        super.drawText(in: paddedRect)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + padding.left + padding.right
        let height = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }
}
