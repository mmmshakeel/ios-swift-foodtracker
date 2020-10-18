//
//  ViewController.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/18/20.
//

import UIKit

class ViewController: UIViewController,
                      UITextFieldDelegate,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keybaord
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.delegate = self
    }


    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        // hide the keyboard
        nameTextField.resignFirstResponder()
        
        // initiate UIImagePickerController
        let imagePickerController = UIImagePickerController()
        
        // allow to select photos from library, not from cametra
        imagePickerController.sourceType = .photoLibrary
        
        // notify viewController with delegate
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }
}

