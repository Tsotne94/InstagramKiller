//
//  placeholder1.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
// ;

import UIKit
import NetworkPackage

final class HomePageViewModel {
    var baseUrl = "http://localhost:3000/v1/"
    let network = NetworkPackage()
    
    var posts: [Post] = []
    
    func getPosts(completion: @escaping () -> Void) {
        network.fetchData(from: "\(baseUrl)users/self/feed", modelType: Response.self) { response in
            switch response {
            case .success(let response):
                guard let posts = response.data else { return }
                self.posts = posts
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }

    func likePost(mediaID: String, completion: @escaping (Bool) -> Void) {
        let emptyRequestBody: [String: String] = [:]
        network.postData(to: "\(baseUrl)media/\(mediaID)/likes", modelType: UserInfoResponse.self, requestBody: emptyRequestBody) { response in
            switch response {
            case .success(let userInfoResponse):
                let isSuccess = userInfoResponse.meta?.code == 200
                completion(isSuccess)
            case .failure(let error):
                completion(false)
            }
        }
    }

}
