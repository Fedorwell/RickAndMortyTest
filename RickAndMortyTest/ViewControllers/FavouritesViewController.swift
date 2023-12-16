//
//  FavouritesViewController.swift
//  RickAndMortyTest
//
//  Created by mac on 09.12.2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first {
        
            let navigationController = UINavigationController(rootViewController: self)
            

            keyWindow.rootViewController = navigationController
            keyWindow.makeKeyAndVisible()
            
            let myButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
            navigationItem.leftBarButtonItem = myButton
        }
        
       
        }
     
    @objc func cancel() {
        navigationController?.popViewController(animated: true)


        }
    
}
 
