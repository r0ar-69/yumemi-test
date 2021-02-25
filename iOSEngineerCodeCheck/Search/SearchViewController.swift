//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: SearchPresenterInput!
    func inject(presenter: SearchPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter.viewDidLoad()
    }
    
    private func setup() {
        tableView.estimatedRowHeight = 118.5
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(R.nib.repositoryCell)
    }
    

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(text: searchBar.text)
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRow(at: indexPath)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRepos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.cell, for: indexPath)!
        
        if let repo = presenter.repo(forRow: indexPath.row) {
            cell.setCell(repo: repo, languageColor: repo.gitHubColor!)
            
        }
        
        return cell
    }
}

extension SearchViewController: SearchPresenterOutput {
    func updateRepos(_ repos: [Repo]) {
        tableView.reloadData()
        //tableView.insertRows(at: [index], with: .fade)
    }
    
    func transitionToDetail(repo: Repo) {
        let detailVC = R.storyboard.detail.instantiateInitialViewController()!
        let model = DetailModel(repo: repo)
        let presenter = DetailPresenter(repo: repo, view: detailVC as DetailPresenterOutput, model: model)
        detailVC.inject(presenter: presenter)
        
        navigationController?.present(detailVC, animated: true, completion: nil)
    }
    
    func closeKeyboard() {
        searchBar.resignFirstResponder()
    }
}
