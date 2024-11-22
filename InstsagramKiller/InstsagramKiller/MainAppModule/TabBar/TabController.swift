//
//  TabControllerViewController.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//
import UIKit

class TabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let home = createTab(iconActive: Icons.homePageHighlighted.rawValue, iconInactive: Icons.homePage.rawValue, vc: homePageViewController())
        let discover = createTab(iconActive: Icons.searchHighlighted.rawValue , iconInactive: Icons.search.rawValue, vc: DiscoverPageViewController())
        let addContent = createTab(iconActive: Icons.addContent.rawValue , iconInactive: Icons.addContent.rawValue, vc: UIViewController())
        let notifications = createTab(iconActive: Icons.favouritesHighlighted.rawValue , iconInactive: Icons.favourites.rawValue, vc: NotificationsViewController())
        let profileDetailsScreen = createTab(iconActive: "bookmarkActive", iconInactive: "bookmarkInactive", vc: ProfileDetailsViewController())
        
        customizeTabBarAppearance()
        
        setViewControllers([home, discover, addContent, notifications, profileDetailsScreen], animated: true)
    }
    
    private func createTab(iconActive: String, iconInactive: String, vc: UIViewController) -> UIViewController {
        let activeImage = UIImage(named: iconActive)
        let inactiveImage = UIImage(named: iconInactive)
        
        let tabBarItem = UITabBarItem(title: nil, image: inactiveImage, selectedImage: activeImage)
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItem.badgeColor = .black
        vc.tabBarItem = tabBarItem
        
        return vc
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

