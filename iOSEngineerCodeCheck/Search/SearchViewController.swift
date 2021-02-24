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
    var gitHubColors: Any?
    var task: URLSessionTask?
    var searchText: String = ""
    var idx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pearseGitHubColors()
        tableView.register(R.nib.repositoryCell)
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 118.5
        return UITableView.automaticDimension
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
                task = URLSession.shared.dataTask(with: url) { (data, res, err) in
                    guard let json = data else {
                        return
                    }
                    if let obj = try? JSONDecoder().decode(Items.self, from: json){
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
    
    func getJSONData() throws -> Data? {
        guard let path = R.file.gitHubColorsJson.path() else { return nil }
        let url = URL(fileURLWithPath: path)
        
        return try Data(contentsOf: url)
    }
    
    func pearseGitHubColors(){
        guard let data = try? getJSONData() else { return }
        guard let pearsedJSON = try? JSONDecoder().decode(GitHubColors.self, from: data) else { return }
        
        gitHubColors = pearsedJSON
    }
    
    func outputGitHubColorCode(language: String?) -> String {
        let mirror = Mirror(reflecting: gitHubColors!)
        var color = "#F34B7D"
        
        if let lang = language {
            let str = lang.remove(characterSet: .whitespaces)
            for child in mirror.children {
                if child.label?.lowercased() == str.lowercased() {
                    color = child.value as! String
                    return color
                }
            }
        }
        
        return color
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.cell, for: indexPath) as! RepositoryCell
        let repo: Repo = repositories[indexPath.row]
        let color = outputGitHubColorCode(language: repo.language)
        repositories[indexPath.row].gitHubColor = color
        cell.setCell(repo: repo, languageColor: color)
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

extension String {
    /// StringからCharacterSetを取り除く
    func remove(characterSet: CharacterSet) -> String {
        return components(separatedBy: characterSet).joined()
    }

    /// StringからCharacterSetを抽出する
    func extract(characterSet: CharacterSet) -> String {
        return remove(characterSet: characterSet.inverted)
    }
}
