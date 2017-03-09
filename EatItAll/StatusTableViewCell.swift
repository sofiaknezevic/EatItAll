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
    
    func configureCell(food:Food) -> Void {


        
        self.foodNameLabel.text = food.name
        self.setupProgressBar()
    }


    func setupProgressBar() {
//        let progress = Float(self.daysLeft) / Float(userFood.food.shelfLife)!
//
//        self.progressBar.setProgress(Float(progress), animated: true)
    }
    
}
