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
        let tempName = food.name
        self.foodLabel.text = tempName
        
    //    self.foodImageView.image = UIImage.init(named:food.imageName)

    }

}
