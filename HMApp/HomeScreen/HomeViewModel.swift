//
//  HomeModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 28.01.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Firebase

class HomeViewModel: ObservableObject {
    // User details
    @Published var name = ""
    @Published var email = ""
    @Published var age = ""
    @Published var imageUrl = ""
    
    // User Image
    @Published var userImage = ""
    
    //Images
    @Published var images = Array(repeating: Data(count: 0), count: 4)
    
    //Loading Screen
    @Published var isLoading = false
    
    // Alert Details
    @Published var alert = false
    @Published var alertmsg = ""
    
    func login(_ email: String, _ password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { res, error in
            
            if let error = error {
                print("Failed to sign in due to ", error.localizedDescription)
            }
            
            if let result = res {
                print("The result is ", result)
            }
            
        }
        
    }
    
    func registerUser(_ username: String,_ email: String,_ password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to register user due to ", error.localizedDescription)
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("Users").document(uid).setData([
                "Username" : self.name,
                "Email" : self.email
//                "Image" : self.imageUrl
//                "Age" : self.age
            ]) { (error) in
                
                if error != nil {
                    self.alertmsg = error!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
            }
            print("User successfully created")
        }
    }
    
    func alertController(title: String) {
        
        let alertView = UIAlertController(title: title, message: alertmsg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            
        }
        
        alertView.addTextField { (textfield) in
            textfield.text = "123"
        }
        
        alertView.addAction(ok)
        
        alertView.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alertView, animated: true, completion: nil)
         
    }
    
}
