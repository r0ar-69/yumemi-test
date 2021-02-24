//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import SwiftIconFont

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var starsLbl: UILabel!
    @IBOutlet weak var watchersLbl: UILabel!
    @IBOutlet weak var forksLbl: UILabel!
    @IBOutlet weak var issuesLbl: UILabel!
    @IBOutlet weak var starIconLbl: UILabel!
    @IBOutlet weak var watchersIconLbl: UILabel!
    @IBOutlet weak var forksIconLbl: UILabel!
    @IBOutlet weak var issuesIconLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var decorationLbl: UILabel! // text is "Writtn In"
    
    internal var repository: Repo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(repo: repository!)
        getImage(repo: repository!)
    }
    
    private func setup(repo: Repo) {
        if let language = repo.language {
            languageLbl.text = language
            languageLbl.textColor = UIColor.hex(string: repo.gitHubColor!, alpha: 1)
        } else {
            decorationLbl.isHidden = true
            languageLbl.text = ""
        }
        descriptionLbl.text = repo.description
        starsLbl.text = "\(repo.stargazersCount) stars"
        watchersLbl.text = "\(repo.watchersCount) watchers"
        forksLbl.text = "\(repo.forksCount) forks"
        issuesLbl.text = "\(repo.openIssuesCount) open issues"
        fullNameLbl.text = repo.fullName
        starIconLbl.font = UIFont.icon(from: .octicon, ofSize: 18)
        starIconLbl.text = String.fontOcticon("star")
        watchersIconLbl.font = UIFont.icon(from: .octicon, ofSize: 18)
        watchersIconLbl.text = String.fontOcticon("eye")
        forksIconLbl.font = UIFont.icon(from: .octicon, ofSize: 18)
        forksIconLbl.text = String.fontOcticon("repo-forked")
        issuesIconLbl.font = UIFont.icon(from: .octicon, ofSize: 18)
        issuesIconLbl.text = String.fontOcticon("issue-opened")
    }
    
    private func getImage(repo: Repo){
        let owner = repo.owner
        if let imgURL = URL(string: owner.avatarUrl) {
            URLSession.shared.dataTask(with: imgURL) { (data, res, err) in
                if (data != nil || (UIImage(data: data!) != nil)) {
                    let img = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.imgView.image = img
                    }
                } else {
                    print(err)
                }
            }.resume()
        } else{
            print("URL Error!!")
        }
    }
}
