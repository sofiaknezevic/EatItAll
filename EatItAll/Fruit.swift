//
//  Fruit.swift
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class Fruit: Food {

    override init(name: String, shelfLife: Int, URL: URL) {
        
        super.init(name: name, shelfLife: shelfLife, URL: URL)
        self.foodType = "Fruit"
        
    }

}
