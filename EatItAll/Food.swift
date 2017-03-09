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
    
    dynamic var name: String!
    dynamic var shelfLife: String!
    dynamic var imageName: String!
    dynamic var groupName: String!
    
    override init() {
        
        super.init()
        
    }
    
    
    init(name:String, shelfLife:String, imageName: String, groupName: String) {
        
        self.name = name
        self.shelfLife = shelfLife
        self.imageName = imageName
        self.groupName = groupName
        super.init()
        
    }
    

}
