//
//  AddCollectionViewCell.swift
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit

class AddCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    
    func configureCellWithFood(food:Food) -> Void {
        
        self.foodLabel.text = food.name
        
        let imageData:Data = try! Data (contentsOf: food.imageURL)
        
        self.foodImageView.image = UIImage (data: imageData)
        
    }

}
