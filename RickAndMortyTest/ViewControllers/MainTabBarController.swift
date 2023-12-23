//
//  MainTabBarController.swift
//  RickAndMortyTest
//
//  Created by mac on 10.12.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    private func createTabBar() {
        //          viewControllers = [
        //              createVC(
        //                  viewController: EpisodesViewController(),
        //                  title: "Episodes",
        //                  image: UIImage(systemName: "house")
        //              ),
        //              createVC(
        //                  viewController: FavouritesViewController(),
        //                  title: "Favourites",
        //                  image: UIImage(systemName: "heart")
        //              )
        //          ]
        //
        //    }
        //}
        viewControllers = [
            UINavigationController(rootViewController: EpisodesViewController()),
            UINavigationController(rootViewController: FavouritesViewController())
        ]
        
        if let episodesNavController = viewControllers?[0] as? UINavigationController {
            episodesNavController.tabBarItem.title = "Episodes"
            episodesNavController.tabBarItem.image = UIImage(systemName: "house")
        }
        
        if let favouritesNavController = viewControllers?[1] as? UINavigationController {
            favouritesNavController.tabBarItem.title = "Favourites"
            favouritesNavController.tabBarItem.image = UIImage(systemName: "heart")
        }
    }
}
