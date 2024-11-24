//
//  DiscoverPageViewController.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 24.11.24.
//
import Foundation
import UIKit

class DiscoverPageViewModel: NSObject {
    
}

extension DiscoverPageViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           print("Search text changed to: \(searchText)")
       }
       
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           print("Search button clicked with text: \(searchBar.text ?? "")")
           searchBar.resignFirstResponder()
       }
}
