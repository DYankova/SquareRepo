//
//  TitleView.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 16.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class TitleView :UIView {
    
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
        label.font = UIFont(name: "Robonto", size: 22)
        label.text = "Name of Repo"
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Robonto", size: 22)
        label.text = "Description of repo"
        label.textColor = UIColor.lightGray
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
    }
}
