//
//  ViewController.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/18/20.
//

import UIKit

class ViewController: UIViewController,
                      UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keybaord
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.delegate = self
    }


    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }
}

