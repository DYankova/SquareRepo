//
//  JsonFetcher.swift
//  SquareRepos
//
//  Created by Dilyana Yankova on 15.09.19.
//  Copyright © 2019 Dilyana Yankova. All rights reserved.
//


import UIKit

class JsonFetcher {
    static var sharedInstance = JsonFetcher()
    var endPoint = "https://api.github.com/orgs/square/repos"
    var repolists = [Repo]()
    
    func fetchData(){
        guard let url = URL(string: endPoint) else { return  }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
                if let  jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as? [Dictionary<String, Any>] {

                    for myDic in jsonResponse{
                        let name = myDic["name"] as? String ?? ""
                        let description =  myDic["description"] as? String ?? ""
                        let repo = RepoCreator.sharedInstance.createRepo(name: name, description: description)
                        RepoCreator.sharedInstance.addRepoToList(repo: repo)
                    }
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
}
