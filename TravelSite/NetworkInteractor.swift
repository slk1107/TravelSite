//
//  NetworkInteractor.swift
//  TravelSite
//
//  Created by Kris on 2020/2/15.
//  Copyright © 2020 Kris. All rights reserved.
//

import Foundation

class NetworkInteractor {
    func fetchSites(completion: @escaping (SiteResponse?) -> (), error: ((Error) -> ())? = nil) {

        let urlComponents = NSURLComponents(string: "https://data.taipei/opendata/datalist/apiAccess")!
        urlComponents.queryItems = [
            URLQueryItem(name: "scope", value: "resourceAquire"),
            URLQueryItem(name: "rid", value: "36847f3f-deff-4183-a5bb-800737591de5"),
            URLQueryItem(name: "offset", value: "10"),
            URLQueryItem(name: "limit", value: "10"),
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, reponseError -> Void in
            
            if let reponseError = reponseError {
                error?(reponseError)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let parsedResponse = try JSONDecoder().decode(SiteResponse.self, from: data)
                completion(parsedResponse)
            } catch let jsonError {
                print(jsonError.localizedDescription)
                error?(jsonError)
            }
        })

        task.resume()
    }
}


struct SiteResponse: Codable {
    var result: DatalistResponse
    
    struct DatalistResponse: Codable {
        var limit: Int
        var offset: Int
        var count: Int
        var results: [SiteInfo]
        
        struct SiteInfo: Codable {
            var info: String
            var stitle: String
            var file: String
            var xbody: String
        }
        
    }
    
}
