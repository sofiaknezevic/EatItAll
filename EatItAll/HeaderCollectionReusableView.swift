//
//  HeaderCollectionReusableView.swift
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-07.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func configureHeader(foodType:String) -> Void {
        
        headerLabel.text = foodType
        
    }
    
}
