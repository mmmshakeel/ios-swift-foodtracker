//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/25/20.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var menuPhoto: UIImageView!
    
    @IBOutlet weak var menuName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
