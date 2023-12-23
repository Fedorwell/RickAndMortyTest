//
//  CharacterDetailsViewController.swift
//  RickAndMortyTest
//
//  Created by mac on 09.12.2023.
//

import Foundation
import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first {
        
            let myButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
            navigationItem.leftBarButtonItem = myButton
        }
        
       
        }
     
    @objc func cancel() {
        navigationController?.popViewController(animated: true)


        }
    
}
