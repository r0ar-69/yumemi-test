//
//  SearchModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchModelInput {
    func fetchRepo(
        query: String,
        completion: @escaping ([Repo]) -> ())
    func setupGitHubColors() -> Mirror?
    func outputGitHubColorCode(
        gitHubColorsMirror: Mirror,
        language: String?,
        completion: @escaping (String?) -> ())
}

final class SearchModel: SearchModelInput {
    
    func fetchRepo(
        query: String,
        completion: @escaping ([Repo]) -> ()) {
        
        let task: URLSessionTask?
        
        if let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") {
            task = URLSession.shared.dataTask(with: url) { (data, res, err) in
                guard let json = data else {
                    return
                }
                if let obj = try? JSONDecoder().decode(Items.self, from: json){
                    completion(obj.repos)
                }
            }
            task?.resume()
        } else{
            print("URL Error!!")
        }
    }
    
    func setupGitHubColors() -> Mirror?{
        let path = R.file.gitHubColorsJson.path()!
        let url = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let pearsedJSON = try? JSONDecoder().decode(GitHubColors.self, from: data) else { return nil }
        let mirror = Mirror(reflecting: pearsedJSON)
        
        return mirror
    }
    
    func outputGitHubColorCode(
        gitHubColorsMirror: Mirror,
        language: String?,
        completion: @escaping (String?) -> ()){

        completion(nil)
        guard let lang = language else {
            completion("#FFFFFF")
            return
        }
        let str = lang.remove(characterSet: .whitespaces)
        for child in gitHubColorsMirror.children {
            if child.label?.lowercased() == str.lowercased() {
                let color = child.value as! String
                completion(color)
                return
            }
        }
    }
}
