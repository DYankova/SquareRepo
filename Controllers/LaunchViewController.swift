//
//  LaunchViewController.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 17.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    lazy var gotoReposButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click to Squre github repos", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var reposIcon: UIImageView = {
        let image = UIImage(named: "launch_icon")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        JsonFetcher.sharedInstance.fetchData()
    }

    func setupViews() {
        view.addSubview(gotoReposButton)
        view.addSubview(reposIcon)
        
        gotoReposButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        gotoReposButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30).isActive = true
        gotoReposButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        gotoReposButton.addTarget(self, action: #selector(openRepositories),  for: UIControl.Event.touchUpInside)

        reposIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        reposIcon.topAnchor.constraint(equalTo: gotoReposButton.bottomAnchor).isActive = true
        reposIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func openRepositories() {
        let reposListViewCotroller: ReposListViewController = ReposListViewController()
        present(reposListViewCotroller, animated: true, completion: nil)
    }
    
}
