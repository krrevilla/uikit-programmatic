//
//  TabBarController.swift
//  MyCourse
//
//  Created by Karl Revilla on 25/8/2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coursesView = UINavigationController(rootViewController: CoursesViewController())
        coursesView.tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        
        let exploreView = ExploreViewController()
        exploreView.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        
        let notificationView = NotificationsViewController()
        notificationView.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell.fill"), selectedImage: nil)
        
        let libraryView = LibraryViewController()
        libraryView.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "rectangle.stack.badge.play.fill"), selectedImage: nil)
        
        self.viewControllers = [
            coursesView,
            exploreView,
            notificationView,
            libraryView
        ]
                    
        tabBar.backgroundColor = .clear
        tabBar.tintColor = UIColor(named: "TabBarTint")
        tabBar.layer.cornerRadius = 30
        tabBar.layer.cornerCurve = .continuous
    }
}
