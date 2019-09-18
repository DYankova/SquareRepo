//
//  RepoCell.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 15.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class RepoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 16)
   
        label.textColor = UIColor.lightGray
        return label
    }()

    lazy var separator : UIView = {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 0.5))
        lineView.layer.borderWidth = 0.2
        lineView.layer.borderColor = UIColor.gray.cgColor
        return lineView
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(separator)
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
}

