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
    
    @IBOutlet weak var largerView: UIView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func configureCell(food:Food) -> Void {
        
        foodLabel.text = food.name
        largerView.layer.borderWidth = 1
        largerView.layer.masksToBounds = false
        largerView.layer.borderColor = UIColor.magenta.cgColor
        largerView.layer.cornerRadius = foodImageView.frame.height/2
        largerView.clipsToBounds = true
        foodImageView.image = UIImage.init(named:food.imageName)
        
    }
    

    
}
