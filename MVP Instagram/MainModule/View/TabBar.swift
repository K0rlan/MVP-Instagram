//
//  TabBar.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 17.02.2021.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MainViewController(), title: NSLocalizedString("", comment: ""), image: Constants.home!),
            createNavController(for: AddNewPostViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "plus")!)
        ]
    }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
