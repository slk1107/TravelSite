//
//  SiteListTableViewController.swift
//  TravelSite
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit


protocol SiteListTableViewUseCase: NSObjectProtocol {
    var presenter: SiteListPresenter! {get set}
    func reloadTableView()
    func showAlertDialog(title: String, message: String)
}

extension SiteListTableViewController: SiteListTableViewUseCase {
    func reloadTableView() {
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
        
    }
    
    func showAlertDialog(title: String, message: String) {
        DispatchQueue.main.async {[weak self] in
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
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
        cell.data = siteInfo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.willDisplay(index: indexPath.row)
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
}
