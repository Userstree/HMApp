//
//  HomeModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 28.01.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

struct UserCredentials: Identifiable, Codable{
    var id = UUID().uuidString
    var username: String
    var email: String
    var userImage: String
    
    enum CodingKeys: String, CodingKey {
        case username, email, userImage
    }
}

class ManageAccount: ObservableObject {
    @Published var userInfo: UserCredentials?
    @Published var userImg: UIImage? = nil
    @Published var isLoaded = false
    @Published var errorMsg = ""
}

extension ManageAccount {
    
    func getUserImage(url: String) {
        let storage = Storage.storage()
        guard let url = userInfo?.userImage else {
            return
        }
        let storageRef = storage.reference(forURL: url)
        var image = UIImage()
        
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading an image ", error.localizedDescription)
            } else {
                print("Image has been loaded successfully")
                image = UIImage(data: data!)!
            }
        }
        
        self.userImg = image
        self.isLoaded = true
    }
    
    func fetchUserData() async {
        do {
            if let userUID = Auth.auth().currentUser?.uid {
                    
                let doc = try await Firestore.firestore().collection("Users").document(userUID).getDocument().data(as: UserCredentials.self)
                
                guard let userData = doc else {
                    throw DatabaseError.failed
                }
                
                print("The fetched data is\(userData.username)")
                self.isLoaded = true
                self.userInfo = userData
            }
        }
        catch {
            errorMsg = error.localizedDescription
        }
    }
    
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { res, error in
            
            if let error = error {
                print("Failed to sign in due to ", error.localizedDescription)
            }
            
            if let result = res {
                print("The result is ", result)
            }
            
        }
        
    }
    
    func registerUser(username: String, email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to register user due to ", error.localizedDescription)
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("Users").document(uid).setData([
                "Username" : username,
                "Email" : email
            ]) { (error) in
                
                if error != nil {
                    self.errorMsg = error!.localizedDescription
                    return
                }
                
            }
            print("User successfully created")
        }
    }
    
}

enum DatabaseError: String, Error {
    case failed = "Failed to Fetch Data"
}

enum AuthError: String, Error {
    case failedToLogin = "Unable to login"
}
