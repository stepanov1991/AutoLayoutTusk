//
//  TabBarViewController.swift
//  AutoLayoutTusk
//
//  Created by user on 02.07.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTubBar()
    }
    
    private func setupTubBar()  {
        view.backgroundColor = .white
        let viewControllers = [
            createNavController(for: CategoryViewController(), title: "ToDo", image: UIImage(systemName: "house")!),
            createNavController(for: SecondViewController(), title: "SecondVC", image: UIImage(systemName: "person")!)
        ]
        self.setViewControllers(viewControllers, animated: true)
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage)  -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationController?.title = title
        return navController
    }
    
    
}
