//
//  SiteListPresenter.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import Foundation

protocol SiteListPresenterProtocol {
    weak var viewController: SiteListTableViewUseCase! {get set}
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func willDisplay(index: Int)
}

class SiteListPresenter: SiteListPresenterProtocol {
    var siteList = [SiteInfo]()
    weak var viewController: SiteListTableViewUseCase!
    var networkInteractor: NetworkInteractor!
    
    
    func viewDidLoad() {
        networkInteractor.fetchSites(completion: {
            [weak self] response in
            if let results = response?.result.results {
                self?.siteList.append(contentsOf: results)
                self?.viewController.reloadTableView()
            }
        })
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return siteList.count
    }
    
    
}
