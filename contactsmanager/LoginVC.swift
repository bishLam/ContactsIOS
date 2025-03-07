//
//  LoginVC.swift
//  contactsmanager
//
//  Created by 13209 on 7/3/2025.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgottenPasswordDidPress(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonDidPress(_ sender: UIButton) {
        guard !emailTextField.text.isBlank else{
            //show an alert to the user
            showAlertMessage(title: "Validation", message: "Email is mandatory")
            return
        }
        
        guard emailTextField.text.isValidEmail else{
            showAlertMessage(title: "Error", message: "Invalid Email Address")
            return
        }
        
        guard !passwordTextField.text.isBlank else{
            showAlertMessage(title: "Error", message: "Password cannt be null or empty characters")
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
