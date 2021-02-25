//
//  SearchPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol SearchPresenterInput {
    var numberOfRepos: Int { get }
    func repo(forRow row: Int) -> Repo?
    func didSelectRow(at indexPath: IndexPath)
    func didTapSearchButton(text: String?)
    func viewDidLoad()
}

protocol SearchPresenterOutput: AnyObject {
    func updateRepos(_ repos: [Repo])
    func transitionToDetail(repo: Repo)
    func closeKeyboard()
}

final class SearchPresenter: SearchPresenterInput {
    private(set) var repos: [Repo] = []
    private(set) var gitHubColorsMirror: Mirror?
    
    private weak var view: SearchPresenterOutput!
    private var model: SearchModelInput
    
    init(view: SearchPresenterOutput, model: SearchModelInput) {
        self.view = view
        self.model = model
    }
    
    var numberOfRepos: Int {
        return repos.count
    }
    
    func viewDidLoad() {
        guard let tmp = model.setupGitHubColors() else { return }
        gitHubColorsMirror = tmp
        print(tmp.children)
    }
    
    func repo(forRow row: Int) -> Repo? {
        guard  row < repos.count else { return nil }
        return repos[row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard let repo = repo(forRow: indexPath.row) else { return }
        view.transitionToDetail(repo: repo)
    }
    
    func didTapSearchButton(text: String?) {
        guard let query = text else { return }
        guard !query.isEmpty else { return }
        
        self.view.closeKeyboard()
        model.fetchRepo(query: query) { [weak self] data in
            self!.repos = data
            for (index, repo) in self!.repos.enumerated() {
                self!.model.outputGitHubColorCode(gitHubColorsMirror: self!.gitHubColorsMirror!, language: repo.language){ [weak self] color in
                    self!.repos[index].gitHubColor = color ?? "#F34B7D"
                    DispatchQueue.main.async {
                        self?.view.updateRepos(self!.repos)
                    }
                }
            }
        }
    }
}
