//
//  LoadingViewController.swift
//  RickAndMortyTest
//
//  Created by Kirill Sinenchenko on 18.12.2023.
//

import UIKit
import AVFoundation

class LoadingViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let logoUpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logoUp")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(logoUpImageView)
        logoUpImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -80).isActive = true
        logoUpImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        logoUpImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        logoUpImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        startRotationAnimation()
        startPulseAnimationUp()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        stopRotationAnimation()
        stopPulseAnimationUp()
    }

    private func startRotationAnimation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0.0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 1.0
        rotation.repeatCount = .infinity

        logoImageView.layer.add(rotation, forKey: "rotationAnimation")

        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = 1.2
        pulseAnimation.duration = 0.5
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity

        logoImageView.layer.add(pulseAnimation, forKey: "pulseAnimation")
    }

    private func stopRotationAnimation() {
        logoImageView.layer.removeAnimation(forKey: "rotationAnimation")
        logoImageView.layer.removeAnimation(forKey: "pulseAnimation")
    }
    
    private func startPulseAnimationUp() {
        let pulseAnimationUp = CABasicAnimation(keyPath: "opacity")
        pulseAnimationUp.fromValue = 1.0
        pulseAnimationUp.toValue = 0.0
        pulseAnimationUp.duration = 0.5
        pulseAnimationUp.autoreverses = true
        pulseAnimationUp.repeatCount = .infinity

        logoUpImageView.layer.add(pulseAnimationUp, forKey: "pulseAnimationUp")
    }

    private func stopPulseAnimationUp() {
        logoUpImageView.layer.removeAnimation(forKey: "pulseAnimationUp")
    }
}

