//
//  ProfileViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//

import UIKit

class ProfileDetailsViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let profileDetailsView: UIView = {
        let profileDetailsView = UIView()
        profileDetailsView.backgroundColor = .clear
        profileDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return profileDetailsView
    }()
    
    private let headerUsername: UILabel = {
        let label = UILabel()
        label.text = "jacob_w"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 50
        container.layer.borderColor = UIColor.systemGray4.cgColor
        container.layer.borderWidth = 2
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zzz")
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 48
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let followersInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let bioStackView: UIStackView = {
        let bioStackView = UIStackView()
        bioStackView.axis = .vertical
        bioStackView.alignment = .leading
        bioStackView.distribution = .fillEqually
        bioStackView.spacing = 5
        bioStackView.translatesAutoresizingMaskIntoConstraints = false
        return bioStackView
    }()
    
    private let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "Jacob West"
        usernameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        usernameLabel.textAlignment = .left
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    private let bioInfoText: UILabel = {
        let bioInfoText = UILabel()
        bioInfoText.textAlignment = .left
        bioInfoText.translatesAutoresizingMaskIntoConstraints = false
        bioInfoText.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        let bioTextString = "Digital goodies designer @pixsellz"
        bioInfoText.attributedText = bioTextString.attributedStringWithAtSymbolHighlighted()
        return bioInfoText
    }()

    private let bioText: UILabel = {
        let bioText = UILabel()
        bioText.text = "Everything is designed."
        bioText.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        bioText.textAlignment = .left
        bioText.translatesAutoresizingMaskIntoConstraints = false
        return bioText
    }()
    
    private let lockIcon: UIImageView = {
        let lockIcon = UIImageView()
        lockIcon.image = UIImage(named: "lockIcon")
        lockIcon.contentMode = .scaleAspectFill
        lockIcon.tintColor = .black
        lockIcon.translatesAutoresizingMaskIntoConstraints = false
        return lockIcon
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
    
    private func createInfoStack(number: String, label: String) -> UIStackView {
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        numberLabel.textAlignment = .center
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = label
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [numberLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        view.backgroundColor = .white
        setupLayout()
        setupFollowersStackView()
        setupBioStackView()
    }
    
    private func setupLayout() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(profileDetailsView)
        profileDetailsView.addSubview(profileImageContainer)
        profileImageContainer.addSubview(profileImage)
        profileDetailsView.addSubview(headerUsername)
        profileDetailsView.addSubview(followersInfoStackView)
        profileDetailsView.addSubview(lockIcon)
        profileDetailsView.addSubview(editButton)
        profileDetailsView.addSubview(bioStackView)
        
        NSLayoutConstraint.activate([
            profileDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileDetailsView.heightAnchor.constraint(equalToConstant: 315),
            
            headerUsername.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            headerUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lockIcon.widthAnchor.constraint(equalToConstant: 9),
            lockIcon.heightAnchor.constraint(equalToConstant: 12),
            lockIcon.rightAnchor.constraint(equalTo: headerUsername.leftAnchor, constant: -8),
            lockIcon.centerYAnchor.constraint(equalTo: headerUsername.centerYAnchor),
            
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
        bioStackView.addArrangedSubview(bioInfoText)
        bioStackView.addArrangedSubview(bioText)
        bioStackView.alignment = .leading
        
        NSLayoutConstraint.activate([
            bioStackView.topAnchor.constraint(equalTo: profileImageContainer.bottomAnchor, constant: 20),
            bioStackView.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            bioStackView.trailingAnchor.constraint(equalTo: editButton.trailingAnchor),
            
            bioStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 49),
        ])
    }

    
}

extension String {
    func attributedStringWithAtSymbolHighlighted(color: UIColor = .systemBlue) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let regex = try? NSRegularExpression(pattern: "@\\w+", options: [])
        let results = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))

        results?.forEach { match in
            attributedString.addAttribute(.foregroundColor, value: color, range: match.range)
        }
        return attributedString
    }
}

