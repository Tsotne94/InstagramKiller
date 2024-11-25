//
//  EditProfileVC.swift
//  InstsagramKiller
//
//  Created by Gio Kakaladze on 24.11.24.
//

import UIKit

class EditProfileVC: UIViewController {
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "Edit Profile"
        headerLabel.textColor = .black
        headerLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    private let doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.backgroundColor = .clear
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.systemBlue, for: .normal)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        return doneButton
    }()
    
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.backgroundColor = .clear
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return cancelButton
    }()
    
    private let profileImage: UIImageView =  {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "vaso")
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 50
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    private let changeProfilePhotoBtn: UIButton = {
        let changeProfilePhotoBtn = UIButton()
        changeProfilePhotoBtn.backgroundColor = .clear
        changeProfilePhotoBtn.setTitle("Change profile photo", for: .normal)
        changeProfilePhotoBtn.setTitleColor(.systemBlue, for: .normal)
        changeProfilePhotoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        changeProfilePhotoBtn.translatesAutoresizingMaskIntoConstraints = false
        return changeProfilePhotoBtn
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let changeNameView: UIView = {
        let changeNameView = UIView()
        changeNameView.backgroundColor = .clear
        changeNameView.translatesAutoresizingMaskIntoConstraints = false
        return changeNameView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let changeNickNameView: UIView = {
        let changeNickNameView = UIView()
        changeNickNameView.backgroundColor = .clear
        changeNickNameView.translatesAutoresizingMaskIntoConstraints = false
        return changeNickNameView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nickname:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your nickname"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let changePronounsView: UIView = {
        let changeNickNameView = UIView()
        changeNickNameView.backgroundColor = .clear
        changeNickNameView.translatesAutoresizingMaskIntoConstraints = false
        return changeNickNameView
    }()
    
    private let pronounsLabel: UILabel = {
        let label = UILabel()
        label.text = "Pronouns:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pronounsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your pronouns"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let changeBioView: UIView = {
        let changeBioView = UIView()
        changeBioView.backgroundColor = .clear
        changeBioView.translatesAutoresizingMaskIntoConstraints = false
        return changeBioView
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enret Bio"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let changeLinksView: UIView = {
        let changeLinksView = UIView()
        changeLinksView.backgroundColor = .clear
        changeLinksView.translatesAutoresizingMaskIntoConstraints = false
        return changeLinksView
    }()
    
    private let linksLabel: UILabel = {
        let linksLabel = UILabel()
        linksLabel.text = "Links:"
        linksLabel.translatesAutoresizingMaskIntoConstraints = false
        return linksLabel
    }()
    
    private let linksTextField: UITextField = {
        let linksTextField = UITextField()
        linksTextField.placeholder = "Add Links"
        linksTextField.translatesAutoresizingMaskIntoConstraints = false
        return linksTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buttonConfigurations()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        setupView()
        setupStackView()
    }
    
    private func setupView() {
        view.addSubview(headerView)
        headerView.addSubview(headerLabel)
        headerView.addSubview(doneButton)
        headerView.addSubview(cancelButton)
        view.addSubview(profileImage)
        view.addSubview(changeProfilePhotoBtn)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            cancelButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            cancelButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 80),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            doneButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            doneButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -10),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.heightAnchor.constraint(equalToConstant: 40),
            
            profileImage.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            changeProfilePhotoBtn.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            changeProfilePhotoBtn.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15),
        ])
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(changeNameView)
        stackView.addArrangedSubview(changeNickNameView)
        stackView.addArrangedSubview(changePronounsView)
        stackView.addArrangedSubview(changeBioView)
        stackView.addArrangedSubview(changeLinksView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: changeProfilePhotoBtn.bottomAnchor, constant: 30),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        changeNameView.addSubview(nameLabel)
        changeNameView.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: changeNameView.leftAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: changeNameView.centerYAnchor),
            
            nameTextField.centerXAnchor.constraint(equalTo: changeNameView.centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: changeNameView.centerYAnchor),
            nameTextField.leftAnchor.constraint(equalTo: changeNameView.leftAnchor, constant: 90),
            nameTextField.rightAnchor.constraint(equalTo: changeNameView.rightAnchor),
        ])
        
        changeNickNameView.addSubview(nicknameLabel)
        changeNickNameView.addSubview(nicknameTextField)
        
        NSLayoutConstraint.activate([
            nicknameLabel.leftAnchor.constraint(equalTo: changeNickNameView.leftAnchor),
            nicknameLabel.centerYAnchor.constraint(equalTo: changeNickNameView.centerYAnchor),
            
            nicknameTextField.centerXAnchor.constraint(equalTo: changeNickNameView.centerXAnchor),
            nicknameTextField.centerYAnchor.constraint(equalTo: changeNickNameView.centerYAnchor),
            nicknameTextField.leftAnchor.constraint(equalTo: changeNickNameView.leftAnchor, constant: 90),
            nicknameTextField.rightAnchor.constraint(equalTo: changeNickNameView.rightAnchor),
        ])
        
        changePronounsView.addSubview(pronounsLabel)
        changePronounsView.addSubview(pronounsTextField)
        
        NSLayoutConstraint.activate([
            pronounsLabel.leftAnchor.constraint(equalTo: changePronounsView.leftAnchor),
            pronounsLabel.centerYAnchor.constraint(equalTo: changePronounsView.centerYAnchor),
            
            pronounsTextField.centerXAnchor.constraint(equalTo: changePronounsView.centerXAnchor),
            pronounsTextField.centerYAnchor.constraint(equalTo: changePronounsView.centerYAnchor),
            pronounsTextField.leftAnchor.constraint(equalTo: changePronounsView.leftAnchor, constant: 90),
            pronounsTextField.rightAnchor.constraint(equalTo: changePronounsView.rightAnchor),
        ])
        
        changeBioView.addSubview(bioLabel)
        changeBioView.addSubview(bioTextField)
        
        NSLayoutConstraint.activate([
            bioLabel.leftAnchor.constraint(equalTo: changeBioView.leftAnchor),
            bioLabel.centerYAnchor.constraint(equalTo: changeBioView.centerYAnchor),
            
            bioTextField.centerXAnchor.constraint(equalTo: changeBioView.centerXAnchor),
            bioTextField.centerYAnchor.constraint(equalTo: changeBioView.centerYAnchor),
            bioTextField.leftAnchor.constraint(equalTo: changeBioView.leftAnchor, constant: 90),
            bioTextField.rightAnchor.constraint(equalTo: changeBioView.rightAnchor),
        ])
        
        changeLinksView.addSubview(linksLabel)
        changeLinksView.addSubview(linksTextField)
        
        NSLayoutConstraint.activate([
            linksLabel.leftAnchor.constraint(equalTo: changeLinksView.leftAnchor),
            linksLabel.centerYAnchor.constraint(equalTo: changeLinksView.centerYAnchor),
            
            linksTextField.centerXAnchor.constraint(equalTo: changeLinksView.centerXAnchor),
            linksTextField.centerYAnchor.constraint(equalTo: changeLinksView.centerYAnchor),
            linksTextField.leftAnchor.constraint(equalTo: changeLinksView.leftAnchor, constant: 90),
            linksTextField.rightAnchor.constraint(equalTo: changeLinksView.rightAnchor),
        ])
    }
    
    private func buttonConfigurations() {
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func doneButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc private func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

