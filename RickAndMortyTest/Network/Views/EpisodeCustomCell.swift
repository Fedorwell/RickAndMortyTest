//
//  CollectionViewCell.swift
//  RickAndMortyTest
//
//  Created by mac on 10.12.2023.
//

import UIKit
class EpisodeCustomCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let episodeLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           return label
       }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, episodeLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
              imageView.addGestureRecognizer(tapGesture)
              imageView.isUserInteractionEnabled = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        //didTapOnImage?()
    }


    private let networkManager = NetworkManager.shared
    
    // MARK: - Public methods
    func configure(with character: Character?) {
        guard let character = character else { return }
        titleLabel.text = character.name
        episodeLabel.text = character.gender
        networkManager.fetchImage(from: character.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                    self?.imageView.image = UIImage(data: imageData)
                print(imageData)
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
