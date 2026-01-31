//
//  AppCoordinator.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import UIKit

final class AppCoordinator {
    
    private let tabBarController: UITabBarController
    private let factory: ModuleFactory

    init(tabBarController: UITabBarController, factory: ModuleFactory) {
        self.tabBarController = tabBarController
        self.factory = factory
    }

    func start() {
        var navigationControllers = [UINavigationController]()
        
        Tabs.allCases.forEach { tab in
            let navigationController: UINavigationController
            let viewController: UIViewController
            
            switch tab {
            case .news:
                viewController = factory.makeNewsViewController()
            case .map:
                viewController = factory.makeMapViewController()
            case .weather:
                viewController = factory.makeWeatherViewController()
            case .profile:
                viewController = factory.makeProfileViewController()
            }
            
            navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(title: tab.rawValue.capitalized, image: tab.image, tag: tab.hashValue)
            
        }
        
        
        
        tabBarController.viewControllers = navigationControllers
    }
}
