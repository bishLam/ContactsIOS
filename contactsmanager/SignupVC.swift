//
//  SignupVC.swift
//  contactsmanager
//
//  Created by 13209 on 7/3/2025.
//

import UIKit

class SignupVC: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signupButtonDidPress(_ sender: Any) {
        
        guard !emailTextField.text.isBlank else{
            showAlertMessage(title: "Error!", message: "Email cannot be empty")
            return
        }
        
        guard emailTextField.text.isValidEmail else{
            showAlertMessage(title: "Invalid Email", message: "The email you entered cannot be valdated. Please check the format of your email")
        return
    }
        
        guard !passwordTextField.text.isBlank else{
            showAlertMessage(title: "Error!", message: "Password cannot be empty")
            return
        }

        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
                let repeatPassword = repeatPasswordTextField.text,
              password == repeatPassword
        else{
            showAlertMessage(title: "Error", message: "Passwords do not match. Please make sure to put the same password")
            return
        }
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
