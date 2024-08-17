//
//  MainTabBarController.swift
//  AeroDiary
//
//  Created by Robert Kotrutsa on 08.08.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()

        setupViewControllers()
        
    }
    
    private func setupTabBarAppearance() {
        
            tabBar.tintColor = .customRed
        
            tabBar.unselectedItemTintColor = .customGray
        
        }
    
    private func setupViewControllers() {
        
            let homeNavController = createNavController(viewController: HomeViewController(), title: "Aero Diary", imageName: "house.fill")
        
            let flightNavController = createNavController(viewController: AddFlightViewController(), title: "Flight", imageName: "airplane")
        
            let historyNavController = createNavController(viewController: HistoryViewController(), title: "History", imageName: "calendar.badge.clock")
            
            viewControllers = [homeNavController, flightNavController, historyNavController]
        
        }
        
        private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
            
            let navController = UINavigationController(rootViewController: viewController)
            
            navController.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), tag: 0)
            
            return navController
            
        }
    
}
