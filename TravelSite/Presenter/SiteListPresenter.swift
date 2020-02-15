//
//  SiteListPresenter.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import Foundation

protocol SiteListPresenterProtocol {
    var viewController: SiteListTableViewUseCase! {get set}
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
            self?.handleFetchCallback(response: response)
        })
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return siteList.count
    }
    
    func willDisplay(index: Int) {
        let currentItemCount = siteList.count
        if currentItemCount - index < 3 {
            networkInteractor.fetchSites(from: siteList.count, completion: {
                [weak self] response in
                self?.handleFetchCallback(response: response)
            })
        }
    }
}

extension SiteListPresenter {
    private func handleFetchCallback(response: SiteResponse?) {
        if let results = response?.result.results {
            siteList.append(contentsOf: results)
            viewController.reloadTableView()
        }
    }
}
