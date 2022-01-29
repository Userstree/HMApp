//
//  HomeModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 28.01.2022.
//

import SwiftUI
import FirebaseAuth

class HomeViewModel: ObservableObject {
    // User details
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    // User Image
    @Published var userImage = ""
    
    //Images
    @Published var images = Array(repeating: Data(count: 0), count: 4)
    
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
    
    func register(_ username: String,_ email: String,_ password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to register user due to ", error.localizedDescription)
            }
        
        }
    }
    
}
