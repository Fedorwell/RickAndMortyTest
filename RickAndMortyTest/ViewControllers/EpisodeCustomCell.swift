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
        // Настройте свойства метки
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Добавьте метку к ячейке
        addSubview(titleLabel)
        
        // Настройте размещение и размер метки
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
