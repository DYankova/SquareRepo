//
//  ReposListViewcontrollet.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 15.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class ReposListViewController: UIViewController {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override func loadView() {
        super.loadView()
     
        let title : TitleView = {
            let title = TitleView()
            title.translatesAutoresizingMaskIntoConstraints = false
            return title
        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(title)

        
        title.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        title.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 70).isActive = true
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant:  10),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        JsonFetcher.sharedInstance.fetchData()
        view.backgroundColor = .white
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RepoCell.self, forCellWithReuseIdentifier: "RepoCell")
        collectionView.reloadData()
    }
}

extension ReposListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return JsonFetcher.sharedInstance.repolists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepoCell", for: indexPath) as! RepoCell
        cell.nameLabel.text = JsonFetcher.sharedInstance.repolists[indexPath.item].name
        cell.descriptionLabel.text = JsonFetcher.sharedInstance.repolists[indexPath.item].repoDescription
        cell.descriptionLabel.numberOfLines = 0
        return cell
    }
    
    func estimatedHeightForText(_ text:String)->CGFloat {
        let approximateWidthOfBioTextView = view.frame.width
        let size = CGSize(width: approximateWidthOfBioTextView, height: 2000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if let repo = JsonFetcher.sharedInstance.repolists[indexPath.item] as? Repo {
                let estimatedFrameHeight = estimatedHeightForText(repo.repoDescription ?? "")
                return CGSize(width: view.frame.width, height: estimatedFrameHeight + 75)
            } else {
                return CGSize(width: view.frame.width, height: 200)
            }
    }
}
