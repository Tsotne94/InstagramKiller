//
//  DiscoverPageViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 24.11.24.
//
import Foundation
import UIKit
import NetworkPackage

protocol ReloadAble: AnyObject {
    func reload()
}

class DiscoverPageViewModel: NSObject {
    private var posts = [Post]()
    private var filteredPosts = [Post]()
    private let networkManager = NetworkPackage()
    weak var reloadDelegate: ReloadAble?
    
    override init() {
        super.init()
        fetchMediaData()
    }
    
    private func fetchMediaData() {
        networkManager.fetchData(from: "http://localhost:3000/v1/media/popular", modelType: Response.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.posts = response.data ?? []
                    self.filteredPosts = self.posts
                    self.reloadDelegate?.reload()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func filterPosts(by searchText: String) {
        if searchText.isEmpty {
            filteredPosts = posts
        } else {
            filteredPosts = posts.filter { post in
                return post.user?.username?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
        reloadDelegate?.reload()
    }
    
    func getUrl(from index: Int) -> URL {
        let imageUrlString = filteredPosts[index].images?.standard_resolution?.url
        let imageUrl = URL(string: imageUrlString ?? "")
        return imageUrl!
    }
    
    var postCount: Int {
        filteredPosts.count
    }
}

extension DiscoverPageViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterPosts(by: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search button clicked with text: \(searchBar.text ?? "")")
        searchBar.resignFirstResponder()
        reloadDelegate?.reload()
    }
}
