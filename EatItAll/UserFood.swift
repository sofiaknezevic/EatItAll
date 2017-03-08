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
    
    var creationDate: Date!
    
    var expiryDate: Date {
        
        return makeExpiryDate(creationDate:creationDate,shelfLife:Double(food.shelfLife)!)
        
    }
    
    var food: Food!
    
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

