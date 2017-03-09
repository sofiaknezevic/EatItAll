//
//  UserFood.swift
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit
import Realm

class UserFood: RLMObject {
    
    dynamic var creationDate: Date!
    
    dynamic var expiryDate: Date {
        //deal with food.shelfLife being a string
        return makeExpiryDate(creationDate:creationDate,shelfLife:Double(food.shelfLife)!)
        
    }
    
    dynamic var food: Food!
    
    override init() {
        
        super.init()
        
    }
    
    init(creationDate:Date ,food:Food ) {
        
        self.food = food
        self.creationDate = creationDate
        super.init()
        
    }
    
    func makeExpiryDate(creationDate:Date ,shelfLife:Double ) -> Date  {
            
        return creationDate.addingTimeInterval(shelfLife*Double(86400))
    }
}

