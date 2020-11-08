//
//  Meal.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/25/20.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("meals")
    
    struct PropetyKey {
        static let name = "name"
        static let photo = "photo"
    }
    
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?) {
        if (name.isEmpty || name.count > 20) {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: "name") as? String else {
            return nil
        }
        
        let photo = coder.decodeObject(forKey: "photo") as? UIImage
        
        self.init(name: name, photo: photo)
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropetyKey.name)
        coder.encode(photo, forKey: PropetyKey.photo)
    }
}
