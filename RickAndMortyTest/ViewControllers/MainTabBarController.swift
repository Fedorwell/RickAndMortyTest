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
    
    private func createTabBar() {
        viewControllers = [ 

           createVC(
                    viewController: EpisodesViewController(),
                    title: "Episodes",
                    image: UIImage(systemName: "house")
           ),
            createVC(
                viewController: FavouritesViewController(),
                title: "Favourites",
                image: UIImage(systemName: "heart")
            )
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
