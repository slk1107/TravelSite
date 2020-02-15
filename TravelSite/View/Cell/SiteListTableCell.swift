//
//  TableViewCell.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit
import Kingfisher
class SiteListTableCell: UITableViewCell {

    @IBOutlet weak var siteTitleLabel: UILabel!
    @IBOutlet weak var siteDescriptionLabel: UILabel!
    @IBOutlet weak var siteImagesCollecitonView: UICollectionView!
    var imageURLs = [URL]() {
        didSet {
            siteImagesCollecitonView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SiteListTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SiteListImagesCollectionViewCell", for: indexPath) as! SiteListImagesCollectionViewCell
        
        cell.thumbnail.kf.setImage(with: imageURLs[indexPath.row], options: [.keepCurrentImageWhileLoading])
        
        return cell
    }
}
