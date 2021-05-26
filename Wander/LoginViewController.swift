//
//  LoginViewController.swift
//  Wander
//
//  Created by Hope Dunner on 4/21/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!

    
    @IBOutlet weak var passwordField: UITextField!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
              let password = passwordField.text!

              PFUser.logInWithUsername(inBackground:username, password:password) {
                (user, error)  in
                if user != nil {
                  self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.displayLoginError(error: error!)
                }
              }
          
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Register")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
            
        }
    

    

    /*------ Handle text field inputs  ------*/
    func usernameAndPasswordNotEmpty() -> Bool {
        return usernameField.text!.isEmpty || passwordField.text!.isEmpty
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
    func displayLoginError(error: Error) {
        let title = "Login Error"
        let message = "Oops! Something went wrong while logging in: \(error.localizedDescription)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    
    
}
