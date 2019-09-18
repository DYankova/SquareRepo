//
//  RepoCreator.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 15.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class RepoCreator {
    static var sharedInstance = RepoCreator()

    func createRepo(name: String, description: String) -> Repo {
        let repo = Repo(name: name, repoDescription: description)
        return repo
    }
    
    func addRepoToList(repo: Repo) {
        JsonFetcher.sharedInstance.repolists.append(repo)
    }

}
