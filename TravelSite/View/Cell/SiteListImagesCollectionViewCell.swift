//
//  SiteListImagesCollectionViewCell.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import UIKit

class SiteListImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var thumbnail: UIImageView!
    override func awakeFromNib() {
        thumbnail.contentMode = .scaleAspectFit
    }
}
