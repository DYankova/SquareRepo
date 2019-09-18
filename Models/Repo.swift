//
//  Repo.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 15.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//

import UIKit

class Repo: NSObject {
    var name: String?
    var repoDescription: String?
    
    init(name: String, repoDescription: String) {
        self.name = name
        self.repoDescription = repoDescription
    }
}
