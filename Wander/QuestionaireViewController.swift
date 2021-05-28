//
//  QuestionaireViewController.swift
//  Wander
//
//  Created by Hope Dunner on 5/25/21.
//

import UIKit
import Parse

class QuestionaireViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
 
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var budgetTextField: UITextField!

    
    
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()
    
    let location = ["Brooklyn", "Manhattan", "Queens", "The Bronx", "Staten Island"]
    let budget = ["$ to $$$", "$$$ to $"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        locationTextField.inputView = pickerView1
        locationTextField.textAlignment = .center
        
        budgetTextField.inputView = pickerView2
        budgetTextField.textAlignment = .center
        
        locationTextField.textColor = UIColor.lightGray
        budgetTextField.textColor = UIColor.lightGray

    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let user_info = PFObject(className: "UserInfo")
        user_info["location"] = self.locationTextField.text
        user_info["budget"] = self.budgetTextField.text
        
        
        user_info.saveInBackground { (success, error) in
          if success{
              self.performSegue(withIdentifier: "homeSegue", sender: nil)
          } else {
              self.displaySignupError(error: error!)
          }
      }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension QuestionaireViewController {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerView1 {
                return location.count

            } else if pickerView == pickerView2{
                 return budget.count
            }

            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerView1 {
                return location[row]

            } else if pickerView == pickerView2{
                 return budget[row]
            }
            return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerView1 {
            locationTextField.text = location[row]
                  self.view.endEditing(false)
            locationTextField.resignFirstResponder()
            
            } else if pickerView2 == pickerView2{
                budgetTextField.text = budget[row]
                  self.view.endEditing(false)
            }
        }
    
    func displaySignupError(error: Error) {
        let title = "Sign up error"
        let message = "Oops! Something went wrong while signing up: \(error.localizedDescription)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    

}
