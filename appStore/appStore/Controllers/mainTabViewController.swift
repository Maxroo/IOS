//
//  mainTabViewController.swift
//  appStore
//
//  Created by admin on 2019-04-25.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import UIKit

class mainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let todayViewController = UIViewController()
        let gameViewController = UIViewController()
        let appsViewController = UIViewController()

        viewControllers = [createViewController(viewController: todayViewController, title: "Today", imageName: "today"),
                           createViewController(viewController: gameViewController, title: "Games", imageName: "games"),
                           createViewController(viewController: appsViewController, title: "Apps", imageName: "apps"),
                           createViewController(viewController: SearchViewController(), title: "Search", imageName: "search")]
    }

    fileprivate func createViewController(
        viewController: UIViewController,
        title: String, imageName: String) -> UIViewController{
        
        viewController.view.backgroundColor = .white
        let NavController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title      = title
        NavController.tabBarItem.title = title
        NavController.navigationBar.prefersLargeTitles = true
        NavController.tabBarItem.image = UIImage(named: imageName)
        return NavController
    }

}
