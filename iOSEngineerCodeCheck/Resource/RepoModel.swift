//
//  RepoModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Items: Codable {
    let repos: [Repo]
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

struct Repo: Codable {
    let name: String
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let description: String?
    var gitHubColor: String?
    
    let owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case language
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case description
        case gitHubColor
        case owner
    }
}

struct Owner: Codable {
    let avatarUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}

extension Repo {
    static let template = Repo(name: "temp", fullName: "template", language: "Swift", stargazersCount: 0, watchersCount: 0, forksCount: 0, openIssuesCount: 0, description: nil, gitHubColor: nil, owner: Owner(avatarUrl: "https://avatars.githubusercontent.com/u/9919?v=4"))
}
