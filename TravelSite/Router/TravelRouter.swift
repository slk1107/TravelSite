//
//  TravelRouter.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit
class TravelRouter {
    static func buildSiteList() -> UIViewController {
        let storyboard = UIStoryboard(name: "SiteList", bundle: nil)
        let rootVC = storyboard.instantiateInitialViewController() as! UINavigationController
        let siteListTableViewController = rootVC.viewControllers[0] as! SiteListTableViewController

        let presenter = SiteListPresenter()
        presenter.viewController = siteListTableViewController
        presenter.networkInteractor = NetworkInteractor()
        siteListTableViewController.presenter = presenter
        
        return rootVC
    }
}
