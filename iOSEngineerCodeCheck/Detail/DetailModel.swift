//
//  DetailModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol DetailModelInput {
    func fetchImage(completion: @escaping (Data) -> ())
}

final class DetailModel: DetailModelInput {
    private let repo: Repo!
    init(repo: Repo) {
        self.repo = repo
    }

    func fetchImage(completion: @escaping (Data) -> ()){
        if let imgURL = URL(string: repo.owner.avatarUrl) {
            URLSession.shared.dataTask(with: imgURL) { (data, res, err) in
                guard let imgData = data else { return }
                completion(imgData)
            }.resume()
        } else{
            print("URL Error!!")
        }
    }
}
