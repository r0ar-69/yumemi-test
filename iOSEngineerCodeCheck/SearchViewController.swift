//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repositories: [Repo] = []
    var task: URLSessionTask?
    var searchText: String!
    var idx: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.text = "GitHubのリポジトリを検索できるよー"
        searchBar.delegate = self
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text!
        
        if searchText.count != 0 {
            if let url = URL(string: "https://api.github.com/search/repositories?q=\(searchText!)") {
                task = URLSession.shared.dataTask(with: url) { (json, res, err) in
                    if let obj = try? JSONDecoder().decode(Items.self, from: json!){
                        self.repositories = obj.repos
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                task?.resume()
            } else{
                print("URL Error!!")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.searchViewController.toDetail.identifier{
            let detailVC = segue.destination as! DetailViewController
            detailVC.searchVC = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let repo:Repo = repositories[indexPath.row]
        cell.textLabel?.text = repo.name
        cell.detailTextLabel?.text = repo.language
        cell.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルをタップした時に呼ばれる
        idx = indexPath.row
        performSegue(withIdentifier: R.segue.searchViewController.toDetail.identifier, sender: self)
    }
}
