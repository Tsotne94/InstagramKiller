//
//  ProfileDetailsViewModel.swift
//  InstsagramKiller
//
//  Created by Gio Kakaladze on 25.11.24.
//

import Foundation
import UIKit
import NetworkPackage

protocol UserViewModelDelegate: AnyObject {
    func didFetchUserData()
    func didFailWithError(_ error: String)
}

final class UserViewModel {
    var user: UserModel?
    var errorMessage: String?
    weak var delegate: UserViewModelDelegate?
    private let apiUrl = "http://localhost:3000/v1/self/info"
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkPackage()) {
        self.networkService = networkService
    }
    
    func createInfoStack(number: String, label: String) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont(name: IGFonts.sfSemiBold.rawValue, size: 16)
        numberLabel.textColor = .tesxt
        
        let textLabel = UILabel()
        textLabel.text = label
        textLabel.font = UIFont(name: IGFonts.sfRegullar.rawValue, size: 13)
        textLabel.textColor = .tesxt
        
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(textLabel)
        
        return stack
    }
    
    func loadFeedImages(from urls: [URL], completion: @escaping ([UIImage]) -> Void) {
        let dispatchGroup = DispatchGroup()
        var images = [UIImage]()
        
        for url in urls {
            dispatchGroup.enter()
            DispatchQueue.global(qos: .userInitiated).async {
                var image = UIImage(named: "placeholder")!
                
                if let data = try? Data(contentsOf: url), let fetchedImage = UIImage(data: data) {
                    image = fetchedImage
                }
                images.append(image)
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Loaded \(images.count) images")
            completion(images)
        }
    }

    func loadProfileImage(from url: URL, into imageView: UIImageView) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    imageView.image = UIImage(named: "...")
                }
            }
        }
    }

    func fetchUser(from urlString: String) {
        networkService.fetchData(from: apiUrl, modelType: UserResponse.self) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let userResponse):
                    self.user = userResponse.data
                    self.delegate?.didFetchUserData()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.delegate?.didFailWithError(error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
