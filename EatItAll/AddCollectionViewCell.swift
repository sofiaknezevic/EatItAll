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
    
    func configureCell(food:Food) -> Void {
        
        foodLabel.text = food.name
        
        foodImageView.image = UIImage.init(named:food.imageName)
        foodImageView.layer.borderWidth = 1
        foodImageView.layer.masksToBounds = false
        foodImageView.layer.borderColor = UIColor.magenta.cgColor
        foodImageView.layer.cornerRadius = foodImageView.frame.height/2
        foodImageView.clipsToBounds = true
    }
    

    
}
