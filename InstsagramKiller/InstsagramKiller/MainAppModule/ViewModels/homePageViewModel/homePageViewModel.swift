//
//  placeholder1.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
// ;

import UIKit
import NetworkPackage


final class homePageViewModel {
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
}
