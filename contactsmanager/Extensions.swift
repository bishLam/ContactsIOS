//
//  Extensions.swift
//  contactsmanager
//
//  Created by 13209 on 7/3/2025.
//

import Foundation
import UIKit


//create an extensions for string

extension Optional where Wrapped == String {
    var isBlank: Bool {
        // if we manage to unwrap the optional. it's not nill. Else it is nill
        
        guard let notNilBool = self //self makes sure that the value is not nill
        else {
            return true
        }
        
        //at ths point notNilBool is not nil, sp we can trim the spaces and check if its empty
        
        return notNilBool.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension Optional where Wrapped  == String {
    var isValidEmail: Bool {
        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

extension String {
    var isBlank : Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension UIViewController{
    func showAlertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
