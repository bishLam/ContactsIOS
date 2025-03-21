//
//  Repository.swift
//  contactsmanager
//
//  Created by 13209 on 21/3/2025.
//

import Foundation
import FirebaseFirestore

class Repository {
    var db = Firestore.firestore();
    
    func findUserContacts(fromCollection name: String, completion: @escaping ([Contact]) -> ()){
        var contacts = [Contact] ();
        db.collection(name)
            .addSnapshotListener{snapshot, error in
                if let document = snapshot?.documents{
                    //at this point we have documents
                    contacts = document.compactMap({ doc -> Contact?  in
                        //this is a dictionary of of all the contacts
                        let data = doc.data()
                        return Contact(id: doc.documentID, dictionary: data)
                    })
                    for contact in contacts {
                        print(contact.toString())
                    }
                    //we execute the completion which is a block of code which is received as param
                    completion(contacts)
                }
                else{
                    print("Error fetching the documents. \(error!.localizedDescription)")
                    return
                }
            }
    }
    
    func addUser(withData user: User) -> Bool {
        var result = true
        let dictionary: [String: Any] = [
            "firstName": user.firstName as String,
            "lastName" : user.lastName as String,
            "email": user.email as String,
            "phone" : user.phone as String,
            "photo" : user.photo as String,
            "registered": user.registered ?? FieldValue.serverTimestamp()
        ]
        db.collection("users").document(user.id).setData(dictionary) {error in
            if let error = error {
                print ("user could not be added \(user.email), error: \(error.localizedDescription)")
                result = false
            }
        }
        return result
    }
}
