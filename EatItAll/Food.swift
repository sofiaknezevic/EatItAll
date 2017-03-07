//
//  Food.swift
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class Food: NSObject {
    
    let name: String
    let shelfLife: Int
    var foodType: String?
    let imageURL: URL
    

    init(name:String, shelfLife:Int, URL: URL) {
        
        self.name = name
        self.shelfLife = shelfLife
        self.imageURL = URL
        super.init()
        
    }
    

}
