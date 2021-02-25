//
//  DetailPresenter.swift
//  iOSEngineerCodeCheck
//
//  Created by 清浦駿 on 2021/02/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol DetailPresenterInput {
    var repo: Repo { get }
    var imgData: Data { get }
    func viewDidLoad()
}

protocol DetailPresenterOutput: AnyObject {
    func drawImgView(imgData: Data)
}

final class DetailPresenter: DetailPresenterInput {
    private(set) var repo: Repo
    private(set) var imgData: Data = Data()
    
    private weak var view: DetailPresenterOutput!
    private var model: DetailModelInput
    
    init(repo: Repo, view: DetailPresenterOutput, model: DetailModelInput) {
        self.repo = repo
        self.view = view
        self.model = model
    }
    
    func viewDidLoad() {
        model.fetchImage() { [weak self] data in
            self?.imgData = data
            self?.view.drawImgView(imgData: self!.imgData)
        }
    }
}
