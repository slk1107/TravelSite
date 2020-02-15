//
//  NetworkEntities.swift
//  TravelSite
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import Foundation
struct SiteResponse: Codable {
    var result: DatalistResponse
}
struct DatalistResponse: Codable {
    var limit: Int
    var offset: Int
    var count: Int
    var results: [SiteInfo]
}
struct SiteInfo: Codable {
    var info: String
    var stitle: String
    var file: String
    var xbody: String
    enum CodingKeys: String, CodingKey {
        case info
        case stitle
        case file
        case xbody
    }
    
    var fileURLs: [URL?] {
        return file.components(separatedBy: "http://").map({URL(string: $0)?.toHttps()})
    }
}
