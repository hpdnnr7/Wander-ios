//
//  RegistrationViewController.swift
//  Wander
//
//  Created by Hope Dunner on 4/21/21.
//
import UIKit
import Parse

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
                    user.username = usernameField.text
                    user.password = PasswordField.text
                      user.signUpInBackground { (success, error) in
                        if success{
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        } else {
                            self.displaySignupError(error: error!)
                        }
                    }
    }
    
    
    @IBAction func onAccountExists(_ sender: Any) {
        
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        vc?.modalPresentationStyle = .overFullScreen
        present(vc!, animated: true)
            
        }
    
    
    /*------ Handle text field inputs  ------*/
func usernameAndPasswordNotEmpty() -> Bool {
    return usernameField.text!.isEmpty || PasswordField.text!.isEmpty
    }
    
    /*------ Alert Controllers ------*/
    // Text fields are empty alert controller
    func displayError() {
        let title = "Error"
        let message = "Username and password field cannot be empty"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    
    // Login error alert controller
    // Sign up error alert controller
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
    


