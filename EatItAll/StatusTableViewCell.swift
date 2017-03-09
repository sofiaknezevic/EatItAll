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
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state!!!!! FROM WHEREE ALIFIA!?!
//    }
    
    func configureCell(userFood:UserFood) -> Void {


        
        foodNameLabel.text = userFood.food.name
        foodImageView.image = UIImage.init(named:userFood.food.imageName)
        foodImageView.layer.borderWidth = 1
        foodImageView.layer.masksToBounds = false
        foodImageView.layer.borderColor = UIColor.magenta.cgColor
        foodImageView.layer.cornerRadius = foodImageView.frame.height/2
        foodImageView.clipsToBounds = true
        self.setupProgressBar(userFood:userFood)
    }


    func setupProgressBar(userFood:UserFood) {
        
        let daysTillExpiry = Float(userFood.expiryDate.timeIntervalSince(Date.init()))/Float (86400)
    
        let progress = daysTillExpiry / Float(userFood.food.shelfLife)!

        self.progressBar.setProgress(Float(progress), animated: true)
    }
    
}
