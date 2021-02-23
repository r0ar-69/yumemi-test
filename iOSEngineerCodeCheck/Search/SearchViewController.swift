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
    var searchText: String = ""
    var idx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {

        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text!
        
        if searchText.count != 0 {
            if let url = URL(string: "https://api.github.com/search/repositories?q=\(searchText)") {
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
        let nextVC = R.storyboard.detail.instantiateInitialViewController()!
        nextVC.repository = repositories[indexPath.row]
        self.navigationController?.present(nextVC, animated: true, completion: nil)
        
    }
}
