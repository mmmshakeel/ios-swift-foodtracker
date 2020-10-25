//
//  Meal.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/25/20.
//

import UIKit

class Meal {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?) {
        if (name.isEmpty || name.count > 20) {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
}
