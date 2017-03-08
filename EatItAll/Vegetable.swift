//
//  Vegetable.swift
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class Vegetable: Food {
    
    var imageName:String?

    
    override init() {
        
        super.init()
        
    }
    
    override init(name:String, shelfLife:Int, imageURLString:String) {

        super.init(name:name, shelfLife:shelfLife, imageURLString:imageURLString)

    }

}
