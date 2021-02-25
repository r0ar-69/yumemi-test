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
    @IBOutlet weak var gitHubLogoLbl: UILabel!
    @IBOutlet weak var gitHubIconLbl: UILabel!
    
    private var presenter: DetailPresenterInput!
    func inject(presenter: DetailPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(repo: presenter.repo)
        
        presenter.viewDidLoad()
    }
    
    private func setup(repo: Repo) {
        if let language = repo.language {
            languageLbl.text = language
            languageLbl.textColor = UIColor.hex(string: repo.gitHubColor ?? "#F34B7D", alpha: 1)
        } else {
            decorationLbl.text = "Language is"
            languageLbl.text = "Not Decided"
        }
        if repo.description != nil{
            descriptionLbl.text = repo.description
        } else {
            descriptionLbl.text = "Descripsion is not exist"
        }
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
        gitHubIconLbl.font = UIFont.icon(from: .fontAwesome5Brand, ofSize: 85)
        gitHubIconLbl.text = String.fontAwesome5Icon("github")
        gitHubLogoLbl.font = UIFont.icon(from: .octicon, ofSize: 45)
        gitHubLogoLbl.text = String.fontOcticon("logo-github")
    }
}

extension DetailViewController: DetailPresenterOutput {
    func drawImgView(imgData: Data) {
        guard let img = UIImage(data: imgData) else { return }
        DispatchQueue.main.async {
            self.imgView.image = img
        }
    }
}
