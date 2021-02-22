//
//  RepoModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/22.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Repo: Codable {
    let id: Int
    let name: String
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let description: String?
    let homepage: String?
    let htmlUrl: String?
    
    let owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case language
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case description
        case homepage
        case htmlUrl = "html_url"
        case owner
    }
}

struct Owner: Codable {
    let avatarUrl: String
    let login: String
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login
    }
}
