//
//  ViewController.swift
//  FoodTracker
//
//  Created by Shakeel Mohamed on 10/18/20.
//

import UIKit

class MealViewController: UIViewController,
                      UITextFieldDelegate,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    var meal: Meal?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keybaord
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        mealNameLabel.text = textField.text
        navigationItem.title = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage { photoImageView?.image = image
            dismiss(animated: true, completion: nil)
    } }
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var saveMealButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameTextField.delegate = self
        
        // setup views if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
        }
        
        updateSaveButtonState()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // invoke only the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveMealButton else {
            // if it is not the save button, log it here for debuging
            
            return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        
        meal = Meal(name: name, photo: photo)
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
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
          fatalError("The MealViewController is not inside a navigation controller")
        }
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }
    
    private func updateSaveButtonState() {
        // disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveMealButton.isEnabled = !text.isEmpty
    }
}

