//
//  LaunchView.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 17.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class LaunchView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var gotoReposButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Squre github repositories", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var reposIcon: UIImageView = {
        let image = UIImage(named: "launch_icon")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews() {
        addSubview(gotoReposButton)
        addSubview(reposIcon)
        
        gotoReposButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        gotoReposButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        reposIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        reposIcon.bottomAnchor.constraint(equalTo: gotoReposButton.topAnchor).isActive = true
        
    }

}
