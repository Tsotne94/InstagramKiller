//
//  TabControllerViewController.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//
import UIKit

class TabController: UITabBarController {
    
    private let profileImage: UIImage = {
        let profileImage = UIImage(named: Icons.ProfilePicture.rawValue)
        return profileImage ?? UIImage()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let home = createTab(iconActive: Icons.homePageHighlighted.rawValue, iconInactive: Icons.homePage.rawValue, vc: homePageViewController())
        let discover = createTab(iconActive: Icons.searchHighlighted.rawValue , iconInactive: Icons.search.rawValue, vc: DiscoverPageViewController())
        let addContent = createTab(iconActive: Icons.addContent.rawValue , iconInactive: Icons.addContent.rawValue, vc: UIViewController())
        let notifications = createTab(iconActive: Icons.favouritesHighlighted.rawValue , iconInactive: Icons.favourites.rawValue, vc: NotificationsViewController())
        let profileDetailsScreen = createTab(iconActive: Icons.ProfilePicture.rawValue, iconInactive: Icons.ProfilePicture.rawValue, vc: ProfileDetailsViewController())
        
        customizeTabBarAppearance()
        
        setViewControllers([home, discover, addContent, notifications, profileDetailsScreen], animated: true)
    }
    
    private func createTab(iconActive: String, iconInactive: String, vc: UIViewController) -> UIViewController {
        if iconActive == Icons.ProfilePicture.rawValue {
            let resizedProfileImage = resizeImage(image: profileImage, targetSize: CGSize(width: 30, height: 30))
            let circularProfileImage = makeCircularImage(image: resizedProfileImage)
            
            let profileImageFinal = circularProfileImage.withRenderingMode(.alwaysOriginal)
            
            let tabBarItem = UITabBarItem(title: nil, image: profileImageFinal, selectedImage: profileImageFinal)
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            tabBarItem.badgeColor = .black
            vc.tabBarItem = tabBarItem
            return vc
        } else {
            let activeImage = UIImage(named: iconActive)?.withRenderingMode(.alwaysOriginal)
            let inactiveImage = UIImage(named: iconInactive)?.withRenderingMode(.alwaysOriginal)
            
            let tabBarItem = UITabBarItem(title: nil, image: inactiveImage, selectedImage: activeImage)
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            tabBarItem.badgeColor = .black
            vc.tabBarItem = tabBarItem
            return vc
        }
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = CGSize(width: targetSize.width * image.scale, height: targetSize.height * image.scale)
        UIGraphicsBeginImageContextWithOptions(size, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage ?? image
    }
    
    private func makeCircularImage(image: UIImage) -> UIImage {
        let size = min(image.size.width, image.size.height)
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), false, image.scale)
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        image.draw(in: rect)
        let circularImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return circularImage ?? image
    }
    
    private func customizeTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.backgroundColor = UIColor(named: BackgroundColors.accent.rawValue)
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        tabBar.itemSpacing = view.bounds.width / 6
        tabBar.itemPositioning = .centered
    }
}

