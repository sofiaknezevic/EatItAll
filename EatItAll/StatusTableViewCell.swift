//
//  StatusTableViewCell.swift
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

import UIKit
import Realm

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var daysLeftLabel: UILabel!
    
    @IBOutlet weak var largerView: UIView!
    
    dynamic var userFoodLan:UserFood!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func configureCell(userFood:UserFood) -> Void {
        let daysTillExpiry = Float(userFood.expiryDate.timeIntervalSince(Date.init()))/Float (86400)
        userFoodLan = userFood
        
        foodNameLabel.text = userFood.food.name
        largerView.layer.borderWidth = 1
        largerView.layer.masksToBounds = false
        largerView.layer.borderColor = UIColor.black.cgColor
        largerView.layer.cornerRadius = foodImageView.frame.height/2
        largerView.clipsToBounds = true
     
        foodImageView.image = UIImage.init(named:userFood.food.imageName)
        
        self.setupProgressBar(userFood:userFood, daysLeft: daysTillExpiry)
        daysLeftLabel.text = "\(Int(daysTillExpiry))"
    }


    func setupProgressBar(userFood:UserFood, daysLeft: Float) {
        
    
        let progress = daysLeft / Float(userFood.food.shelfLife)!

        self.progressBar.setProgress(Float(progress), animated: true)
    }
    
}
