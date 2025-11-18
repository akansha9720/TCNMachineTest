//
//  MainTabBarController.swift
//  TCNMachineTest
//
//  Created by Akansha Rana on 13/11/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.isTranslucent = false
        tabBar.tintColor = #colorLiteral(red: 0.9975908399, green: 0.801512301, blue: 0.2920140624, alpha: 1)
        tabBar.unselectedItemTintColor = .white
    }
    
    
    
    
}
