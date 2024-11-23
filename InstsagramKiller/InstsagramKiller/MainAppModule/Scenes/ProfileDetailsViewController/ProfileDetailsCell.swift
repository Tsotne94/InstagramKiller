//
//  ProfileDetailsCell.swift
//  InstsagramKiller
//
//  Created by Gio Kakaladze on 22.11.24.
//

import UIKit

class ProfileDetailsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "ProfileDetailsCell"
    
    private let profileDetailsView: UIView = {
        let profileDetailsView = UIView()
        profileDetailsView.backgroundColor = .clear
        profileDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return profileDetailsView
    }()
    
    private let headerUsername: UILabel = {
        let headerUsername = UILabel()
        headerUsername.text = "jacob_w"
        headerUsername.font = UIFont.boldSystemFont(ofSize: 18)
        headerUsername.textAlignment = .center
        headerUsername.translatesAutoresizingMaskIntoConstraints = false
        return headerUsername
    }()
    
    private let profileImageContainer: UIView = {
        let profileImageContainer = UIView()
        profileImageContainer.layer.cornerRadius = 50
        profileImageContainer.layer.borderColor = UIColor.systemGray4.cgColor
        profileImageContainer.layer.borderWidth = 2
        profileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        return profileImageContainer
    }()
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "zzz")
        profileImage.backgroundColor = .orange
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 48
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    private let lockIcon: UIImageView = {
        let lockIcon = UIImageView()
        lockIcon.image = UIImage(named: "lockIcon")
        lockIcon.contentMode = .scaleAspectFill
        lockIcon.clipsToBounds = true
        lockIcon.translatesAutoresizingMaskIntoConstraints = false
        return lockIcon
    }()
    
    private let followersInfoStackView: UIStackView = {
        let followersInfoStackView = UIStackView()
        followersInfoStackView.axis = .horizontal
        followersInfoStackView.alignment = .center
        followersInfoStackView.distribution = .fillEqually
        followersInfoStackView.spacing = 16
        followersInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        return followersInfoStackView
    }()
    
    private let bioStackView: UIStackView = {
        let bioStackView = UIStackView()
        bioStackView.axis = .vertical
        bioStackView.alignment = .leading
        bioStackView.spacing = 5
        bioStackView.translatesAutoresizingMaskIntoConstraints = false
        return bioStackView
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "Jacob West"
        usernameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    private let bioText: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        
        let bioString = "Digital goodies designer @pixsellz\nEverything is designed."
        let attributedString = NSMutableAttributedString(string: bioString)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        paragraphStyle.alignment = .left
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: bioString.count))
        
        if let range = bioString.range(of: "@pixsellz") {
            let nsRange = NSRange(range, in: bioString)
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: nsRange)
        }
        label.attributedText = attributedString
        return label
    }()
    
    private let editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Edit Profile", for: .normal)
        editButton.backgroundColor = .clear
        editButton.setTitleColor(.black, for: .normal)
        editButton.layer.cornerRadius = 6
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.systemGray4.cgColor
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        return editButton
    }()
    
    private let feedCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.isScrollEnabled = false
        return collection
    }()
    
    let imageArr: [UIImage] = (1...13).compactMap { UIImage(named: "image\($0)") }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profileDetailsView)
        contentView.addSubview(feedCollection)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupLayout()
        setupFollowersStackView()
        setupBioStackView()
        setupCollectionView()
    }
    
    private func setupLayout() {
        profileDetailsView.addSubview(profileImageContainer)
        profileImageContainer.addSubview(profileImage)
        profileDetailsView.addSubview(headerUsername)
        profileDetailsView.addSubview(followersInfoStackView)
        profileDetailsView.addSubview(editButton)
        profileDetailsView.addSubview(bioStackView)
        profileDetailsView.addSubview(lockIcon)
        
        NSLayoutConstraint.activate([
            profileDetailsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileDetailsView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            profileDetailsView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            profileDetailsView.heightAnchor.constraint(equalToConstant: 315),
            
            headerUsername.topAnchor.constraint(equalTo: profileDetailsView.topAnchor, constant: 15),
            headerUsername.centerXAnchor.constraint(equalTo: profileDetailsView.centerXAnchor),
            lockIcon.centerYAnchor.constraint(equalTo: headerUsername.centerYAnchor),
            lockIcon.rightAnchor.constraint(equalTo: headerUsername.leftAnchor, constant: -8),
            
            profileImageContainer.topAnchor.constraint(equalTo: headerUsername.bottomAnchor, constant: 15),
            profileImageContainer.leftAnchor.constraint(equalTo: profileDetailsView.leftAnchor, constant: 11),
            profileImageContainer.widthAnchor.constraint(equalToConstant: 100),
            profileImageContainer.heightAnchor.constraint(equalToConstant: 100),
            
            profileImage.centerXAnchor.constraint(equalTo: profileImageContainer.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profileImageContainer.centerYAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 93),
            profileImage.heightAnchor.constraint(equalToConstant: 93),
            
            editButton.topAnchor.constraint(equalTo: bioStackView.bottomAnchor, constant: 20),
            editButton.leftAnchor.constraint(equalTo: profileDetailsView.leftAnchor, constant: 16),
            editButton.rightAnchor.constraint(equalTo: profileDetailsView.rightAnchor, constant: -16),
            editButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupFollowersStackView() {
        let postsStack = createInfoStack(number: "54", label: "Posts")
        let followersStack = createInfoStack(number: "874", label: "Followers")
        let followingsStack = createInfoStack(number: "162", label: "Following")
        followersInfoStackView.addArrangedSubview(postsStack)
        followersInfoStackView.addArrangedSubview(followersStack)
        followersInfoStackView.addArrangedSubview(followingsStack)
        
        NSLayoutConstraint.activate([
            followersInfoStackView.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            followersInfoStackView.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 40)
        ])
    }
    
    private func setupBioStackView() {
        bioStackView.addArrangedSubview(usernameLabel)
        bioStackView.addArrangedSubview(bioText)
        
        NSLayoutConstraint.activate([
            bioStackView.topAnchor.constraint(equalTo: profileImageContainer.bottomAnchor, constant: 20),
            bioStackView.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            bioStackView.trailingAnchor.constraint(equalTo: editButton.trailingAnchor)
        ])
    }
    
    private func setupCollectionView() {
        feedCollection.delegate = self
        feedCollection.dataSource = self
        feedCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        NSLayoutConstraint.activate([
            feedCollection.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            feedCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            feedCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            feedCollection.heightAnchor.constraint(equalToConstant: calculateHeight()),
            feedCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func createInfoStack(number: String, label: String) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let textLabel = UILabel()
        textLabel.text = label
        textLabel.font = UIFont.systemFont(ofSize: 12)
        
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(textLabel)
        
        return stack
    }
    
    private func calculateHeight() -> CGFloat {
        let rows = ceil(CGFloat(imageArr.count) / 3.0)
        let itemHeight: CGFloat = 139
        let verticalSpacing: CGFloat = 2
        let totalHeight = (rows * itemHeight) + ((rows - 1) * verticalSpacing)
        return totalHeight
    }
    
    // MARK: - Collection View DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = UIImageView(image: imageArr[indexPath.item])
        cell.contentView.addSubview(imageView)
        imageView.frame = cell.bounds
        return cell
    }
    
    // MARK: - Collection View FlowLayout Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 2) / 3
        return CGSize(width: width, height: 138)
      }
}
