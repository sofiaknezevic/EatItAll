//
//  NetworkManager.swift
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-07.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    func imageDatafrom(URL:URL) -> Data? {
        
        var imageData:Data?
        let fileManager = FileManager.default
        let downloadRequest = URLRequest.init(url: URL)
        let session = URLSession.shared.downloadTask(with: downloadRequest) { (location:URL? , response:URLResponse?, error:Error?) in
            
            if let error = error{
                print("\(error)")
                return
            }
            
            let locationString = "\(location)"
            
            imageData = fileManager.contents(atPath:locationString)!
            
        }
        session.resume()
        guard let returnData = imageData else{
            return nil
        }
        return returnData
    }
}
