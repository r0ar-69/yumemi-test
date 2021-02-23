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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(repo: Repo) {
        iconLbl.font = UIFont.icon(from: .octicon, ofSize: 19)
        iconLbl.text = String.fontOcticon("repo")
        starIconLbl.font = UIFont.icon(from: .octicon, ofSize: 16)
        starIconLbl.text = String.fontOcticon("star")
        languageIconLbl.font = UIFont.icon(from: .fontAwesome5Solid, ofSize: 10)
        languageIconLbl.text = String.fontAwesome5Icon("circle")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
