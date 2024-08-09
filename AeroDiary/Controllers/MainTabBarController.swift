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
        
        tabBar.tintColor = .customRed
        
        tabBar.unselectedItemTintColor = .customGray

        let homeNavController = UINavigationController(rootViewController: HomeViewController())
        
        let flightNavController = UINavigationController(rootViewController: FlightViewController())
        
        let historyNavController = UINavigationController(rootViewController: HistoryViewController())

        homeNavController.tabBarItem = UITabBarItem(title: "Aero Diary", image: UIImage(systemName: "house.fill"), tag: 0)
        
        flightNavController.tabBarItem = UITabBarItem(title: "Flight", image: UIImage(systemName: "airplane"), tag: 1)
        
        historyNavController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "calendar.badge.clock"), tag: 2)

        viewControllers = [homeNavController, flightNavController, historyNavController]
        
    }
    
}
