//
//  SiteListEntities.swift
//  TravelSite
//
//  Created by Kris on 2020/2/16.
//  Copyright © 2020 Kris. All rights reserved.
//

import Foundation
struct UISiteInfo {
    var title: String
    var imageURLs: [URL]
    var description: String
    init(serverInfo: SiteInfo) {
        self.title = serverInfo.stitle
        self.description = serverInfo.xbody
        let fileURLs = serverInfo.file
            .components(separatedBy: "http://")
            .map({URL(string: $0)?.toHttps()})
            .filter({$0 != nil}) as! [URL]
        self.imageURLs = fileURLs
    }
}
