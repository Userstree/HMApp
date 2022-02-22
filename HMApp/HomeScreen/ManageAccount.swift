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
    let id = UUID().uuidString
    let username, email, imageUrl: String
//    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case username, email, imageUrl
    }
    
    init(username: String, email: String, imageUrl: String) {
        self.username = username
        self.email = email
        self.imageUrl = imageUrl
    }
    
//    init() {
//        let storage = Storage.storage().reference(forURL: userImageUrl)
//
//        storage.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//                print("Error downloading an image ", error.localizedDescription)
//            } else {
//                print("Image has been loaded successfully")
//                self.image = Image(uiImage: UIImage(data: data!)!)
//            }
//        }
//    }
    
    func getImage() -> Image? {
        var image: Image?
        guard let currentUser = Auth.auth().currentUser?.uid else {
            print("Current user Value is empty")
            return nil
        }
        
        Firestore.firestore().collection("Users").document(currentUser).addSnapshotListener { snapshot, error in
            guard let document = snapshot else {
                print("Error fetching the document")
                return
            }
            do {
                let data = try document.data(as: UserCredentials.self)
                guard let url = data?.imageUrl else {
                    print("could not convert to url")
                    return
                }
                print("url: ", url)
                
                Storage.storage().reference(forURL: url).getData(maxSize: 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error downloading an image ", error.localizedDescription)
                    } else {
                        print("Image has been loaded successfully")
                        image = Image(uiImage: UIImage(data: data!)!)
                    }
                }
                
            } catch {
                fatalError("Document data is empty")
            }
        }
        return image
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        username = try values.decode(String.self, forKey: .username)
//        email = try values.decode(String.self, forKey: .email)
//        imageUrl = try values.decode(String.self, forKey: .imageUrl)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(email, forKey: .email)
//        try container.encode(username, forKey: .username)
//        try container.encode(imageUrl, forKey: .imageUrl)
//    }
}

class ManageAccount: ObservableObject {
    @Published var userInfo: UserCredentials?
    @Published var isLoaded = false
    @Published var errorMsg = ""
}

extension ManageAccount {
    
    
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
