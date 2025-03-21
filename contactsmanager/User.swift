//
//  User.swift
//  contactsmanager
//
//  Created by 13209 on 21/3/2025.
//
import FirebaseFirestore

class User {
    var id: String!
    var email:String
    var firstName:String
    var lastName:String
    var phone:String
    var photo:String
    var dob:Timestamp!
    var registered: Timestamp!
    
    init(id: String, email: String, firstName: String, lastName: String, phone: String, photo: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.photo = photo
    }
    
    init(id: String, email: String, firstName: String, lastName: String, phone: String, photo: String, dob:Timestamp, registered:Timestamp? = nil) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.photo = photo
        self.dob = dob
        self.registered = registered
    }
    
    convenience init(id:String, dictionary: [String: Any]) {
        self.init(id: id,
                  email: dictionary["email"] as! String,
                  firstName: dictionary["firstName"] as! String,
                  lastName: dictionary["lastName"] as! String,
                  phone: dictionary["phone"] as! String,
                  photo: dictionary["photo"] as! String,
                  dob: dictionary["dob"] as! Timestamp,
                  registered: dictionary["registered"] as? Timestamp)
    }
}
