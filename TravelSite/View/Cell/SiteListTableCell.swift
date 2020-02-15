//
//  TableViewCell.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit

class SiteListTableCell: UITableViewCell {

    @IBOutlet weak var siteTitleLabel: UILabel!
    @IBOutlet weak var siteDescriptionLabel: UILabel!
    @IBOutlet weak var siteImagesCollecitonView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
