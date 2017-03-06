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
    
    

    init(name:String, startDate:Date, endDate:Date, shelfLife:Int) {
        
        self.name = name
        self.shelfLife = shelfLife
        
        super.init()
        
    }
    

}
