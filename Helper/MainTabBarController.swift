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

        let newsVC = NewsViewController(viewModel: NewsViewModel())
        let mapVC = MapViewController(viewModel: MapViewModel())
        let weatherVC = WeatherViewController(viewModel: WeatherViewModel())
        let profileVC = ProfileViewController(viewModel: ProfileViewModel())

        let newsNav = UINavigationController(rootViewController: newsVC)
        let mapNav = UINavigationController(rootViewController: mapVC)
        let weatherNav = UINavigationController(rootViewController: weatherVC)
        let profileNav = UINavigationController(rootViewController: profileVC)

        newsNav.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(named: "newsItem"),
            tag: 0
        )

        mapNav.tabBarItem = UITabBarItem(
            title: "Map",
            image: UIImage(named: "mapItem"),
            tag: 1
        )

        weatherNav.tabBarItem = UITabBarItem(
            title: "Weather",
            image: UIImage(named: "weatherItem"),
            tag: 2
        )

        profileNav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "profileItem"),
            tag: 3
        )

        viewControllers = [newsNav, mapNav, weatherNav, profileNav]
    }
}
