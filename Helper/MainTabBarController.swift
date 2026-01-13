//
//  MainTabBarController.swift
//  
//
//  Created by David Cheshenko on 13.01.26.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {

        // 1. Создаём экраны
        let newsVC = NewsViewController()
        let mapVC = MapViewController()
        let weatherVC = WeatherViewController()
        let profileVC = ProfileViewController()

        // 2. Оборачиваем в NavigationController
        let newsNav = UINavigationController(rootViewController: newsVC)
        let mapNav = UINavigationController(rootViewController: mapVC)
        let weatherNav = UINavigationController(rootViewController: weatherVC)
        let profileNav = UINavigationController(rootViewController: profileVC)

        // 3. Кнопки TabBar
        newsNav.tabBarItem = UITabBarItem(
            title: "newsItem",
            image: UIImage(systemName: "newsItem"),
            tag: 0
        )

        mapNav.tabBarItem = UITabBarItem(
            title: "mapItem",
            image: UIImage(systemName: "mapItem"),
            tag: 1
        )

        weatherNav.tabBarItem = UITabBarItem(
            title: "weatherItem",
            image: UIImage(systemName: "weatherItem"),
            tag: 2
        )

        profileNav.tabBarItem = UITabBarItem(
            title: "profileItem",
            image: UIImage(systemName: "profileItem"),
            tag: 3
        )

        // 4. Добавляем вкладки
        viewControllers = [newsNav, mapNav, weatherNav, profileNav]
    }
}

