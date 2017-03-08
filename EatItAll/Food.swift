//
//  Food.swift
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit
import Realm

class Food: RLMObject {
    
    var name: String!
    var shelfLife: Int!
    var imageURLString: String!
    
    override init() {
        
        super.init()
        
    }
    
    
    init(name:String, shelfLife:Int, imageURLString: String) {
        
        self.name = name
        self.shelfLife = shelfLife
        self.imageURLString = imageURLString
        
        super.init()
        
    }
    

}
