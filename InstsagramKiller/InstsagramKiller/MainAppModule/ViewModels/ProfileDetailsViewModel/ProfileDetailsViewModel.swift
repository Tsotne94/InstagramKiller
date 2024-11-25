//
//  placeholder4.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
// ;

import Foundation
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


