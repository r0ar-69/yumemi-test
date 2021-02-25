//
//  RepositoryCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/23.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit
import SwiftIconFont

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var iconLbl: UILabel!
    @IBOutlet weak var starIconLbl: UILabel!
    @IBOutlet weak var languageIconLbl: UILabel!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var starCountLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(repo: Repo, languageColor: String) {
        iconLbl.font = UIFont.icon(from: .octicon, ofSize: 15)
        iconLbl.text = String.fontOcticon("repo")
        starIconLbl.font = UIFont.icon(from: .octicon, ofSize: 16)
        starIconLbl.text = String.fontOcticon("star")
        languageIconLbl.font = UIFont.icon(from: .fontAwesome5Solid, ofSize: 10)
        languageIconLbl.text = String.fontAwesome5Icon("circle")
        fullNameLbl.text = repo.fullName
        descriptionLbl.text = repo.description
        starCountLbl.text = String(repo.stargazersCount)
        languageLbl.text = repo.language
        if repo.language != nil {
            languageIconLbl.textColor = UIColor.hex(string: languageColor, alpha: 1)
        } else {
            languageIconLbl.isHidden = true
        }
    }
    
    func outputGitHubColorCode(gitHubColorsMirror: Mirror, language: String?) -> String {
        var color = "#F34B7D"
        
        if let lang = language {
            let str = lang.remove(characterSet: .whitespaces)
            for child in gitHubColorsMirror.children {
                if child.label?.lowercased() == str.lowercased() {
                    color = child.value as! String
                    return color
                }
            }
        }
        
        return color
    }
}
