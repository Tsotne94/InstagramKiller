//
//  InteractiveButtonsViewModel.swift
//  InstsagramKiller
//
//  Created by Beka on 24.11.24.
//

import UIKit

final class InteractiveButtonsViewModel {
    private let homePageViewModel = HomePageViewModel()
    private let userDefaultsKey = "LikedItems"
    private var likedItems: Set<Int> {
        get {
            let savedArray = UserDefaults.standard.array(forKey: userDefaultsKey) as? [Int] ?? []
            return Set(savedArray)
        }
        set {
            UserDefaults.standard.set(Array(newValue), forKey: userDefaultsKey)
        }
    }
    
    func shareButtonTapped(image: UIImage?, window: UIWindow?) {
        guard let image else { return }
        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
        let temporaryDirectory = FileManager.default.temporaryDirectory
        let imageURL = temporaryDirectory.appendingPathComponent("shared_image.jpg")
        
        do {
            try imageData.write(to: imageURL)
            
            let items: [Any] = [imageURL]
            let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
            
            activityViewController.excludedActivityTypes = [
                .postToFacebook,
                        .postToTwitter,
                        .addToReadingList,
                        .assignToContact,
                        .copyToPasteboard,
                        .airDrop,
                        .openInIBooks,
                        .postToFlickr,
                        .postToVimeo,
                        .print,
                        .saveToCameraRoll,
                        
                ]
            
            if let viewController = window?.rootViewController {
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        } catch {
            print("Failed to save image: \(error)")
        }
    }
    
    func isItemLiked(itemTag: Int) -> Bool {
        return likedItems.contains(itemTag)
    }
    
    func toggleLike(for itemTag: Int, button: UIButton) {
        let isCurrentlyLiked = isItemLiked(itemTag: itemTag)
        if isCurrentlyLiked {
            likedItems.remove(itemTag)
            button.setImage(UIImage(named: Icons.favouritesHighlighted.rawValue), for: .normal)
        } else {
            likedItems.insert(itemTag)
            button.setImage(UIImage(named: Icons.favourites.rawValue), for: .normal)
        }
    }
}
