//
//  ImageCacheManager.swift
//  InstsagramKiller
//
//  Created by Beka on 24.11.24.
//

import UIKit

class ImageCacheManager {
    
    static let shared = ImageCacheManager()

    private var imageCache: [String: UIImage] = [:]
    
    private init() {}
    
    func getImage(for url: String) -> UIImage? {
        return imageCache[url]
    }
    
    func cacheImage(_ image: UIImage?, for url: String?) {
        guard let url, let image else { return }
        imageCache[url] = image
    }
}
