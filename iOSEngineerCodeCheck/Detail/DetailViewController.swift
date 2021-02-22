//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var starsLbl: UILabel!
    @IBOutlet weak var watchersLbl: UILabel!
    @IBOutlet weak var forksLbl: UILabel!
    @IBOutlet weak var issuesLbl: UILabel!
    
    var repository: Repo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = repository!
        
        if let language = repo.language {
            languageLbl.text = "Written in \(language)"
        } else {
            languageLbl.text = ""
        }
        starsLbl.text = "\(repo.stargazersCount) stars"
        watchersLbl.text = "\(repo.watchersCount) watchers"
        forksLbl.text = "\(repo.forksCount) forks"
        issuesLbl.text = "\(repo.openIssuesCount) open issues"
        getImage()
    }
    
    func getImage(){
        let repo = repository!
        
        fullNameLbl.text = repo.fullName
        
        let owner = repo.owner
        let imgURL = owner.avatarUrl
        URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
            let img = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.imgView.image = img
            }
        }.resume()
        
    }
}
