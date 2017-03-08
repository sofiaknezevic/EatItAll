//
//  Fruit.swift
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class Fruit: Food {


    override init() {
        
        super.init()
        
    }
    
    override init(name: String, shelfLife: String, imageName: String, groupName: String) {
        
        super.init(name: name, shelfLife: shelfLife, imageName:imageName, groupName: groupName)
        
    }

}
