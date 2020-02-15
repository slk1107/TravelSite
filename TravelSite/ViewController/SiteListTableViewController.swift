//
//  SiteListTableViewController.swift
//  TravelSite
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit


protocol SiteListTableViewUseCase {
    var presenter: SiteListPresenter! {get set}
    func reloadTableView()
}

extension SiteListTableViewController: SiteListTableViewUseCase {
    func reloadTableView() {
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
        
    }
}

class SiteListTableViewController: UITableViewController {
    
    var presenter: SiteListPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return presenter.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SiteListTableCell", for: indexPath) as! SiteListTableCell
        let siteInfo = presenter.siteList[indexPath.row]
        cell.siteTitleLabel.text = siteInfo.stitle
        cell.siteDescriptionLabel.text = siteInfo.xbody
        let imageURLs = siteInfo.fileURLs.filter({$0 != nil}) as! [URL]
        cell.imageURLs = imageURLs
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
