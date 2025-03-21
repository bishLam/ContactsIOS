//
//  SignupVC.swift
//  contactsmanager
//
//  Created by 13209 on 7/3/2025.
//

import UIKit
import FirebaseAuth

class SignupVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    var service = Repository()
    
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
        
        
        //all information is ready to be used
        //This is the point where we will be using the firebase authentication
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            guard error == nil else{
                self.showAlertMessage(title: "Account Creation Failed", message: "\(error!.localizedDescription)")
                return
            }

            print(authResult?.user.uid)
            //email confirmation
            
            
            
            

            let registerClosure: () -> Void = {
                let userAuthID = Auth.auth().currentUser?.uid
                //register the user with its id in firestore
                let user = User(id: userAuthID!,
                                email: email,
                                firstName: "",
                                lastName: "",
                                phone: "",
                                photo: "")
                
                //save the object user into the database calling the repository
                if self.service.addUser(withData: user){
                    print("User successfully added")
                }
                                
                //remove the visible view controller from backstack (making Log in visible now)
                self.navigationController?.popViewController(animated: true)
            }
            
            Auth.auth().currentUser?.sendEmailVerification{error in
                guard error == nil else{
                    self.showAlertMessage(title: "Error", message: "\(error?.localizedDescription)")
                        return
                }
                self.showAlertMessageWithHandler(title: "Pending verification", message: "Verify your email before signing in", onCompletion: registerClosure)
            }
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
