//
//  UserRepository.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 01.03.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

protocol UserRepositoryProtocol {
    func fetchUser(completion: @escaping (User) -> Void)
}

final class UserRepository: UserRepositoryProtocol {
    
    func fetchUser(completion: @escaping (User) -> Void) {
        var user: User = .init(username: "NoUsername", image: UIImage(systemName: "bell")!)

        guard let currentUser = Auth.auth().currentUser?.uid else {
            print("Current user Value is empty")
            return
        }
        
        Firestore.firestore().collection("Users").document(currentUser).addSnapshotListener { snapshot, error in
            guard let data = snapshot?.data() else {
                print("Error fetching the document \(String(describing: error?.localizedDescription))")
                return
            }
            guard let username = data["username"] as? String else {
                return
            }
            user.username = username
            if let userImg = data["userImage"] as? String {
                DispatchQueue.main.async {
                    Storage.storage().reference(forURL: userImg).getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if error != nil {
                            print("Error in storage download", error?.localizedDescription)
                            return
                        }
                        guard let data = data else {
                            return
                        }
                        user.image = data
                        completion(user)
                    }
                }
            }
        }
    }
}
