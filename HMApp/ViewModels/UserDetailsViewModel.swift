//
//  HomeModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 28.01.2022.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift

class UserDetailsViewModel: ObservableObject
{
    @Published var userInfo: User?
    @Published var cardsInfo: [Card]?
    @Published var errorMsg = ""
    
    private let userRepository: UserRepositoryProtocol
    private let cardRepository: CardRepositoryProtocol
    
    init(cardRepository: CardRepositoryProtocol = CardRepository(),userRepository: UserRepositoryProtocol = UserRepository())
    {
        self.userRepository = userRepository
        self.cardRepository = cardRepository
    }
}

extension UserDetailsViewModel
{
    func onAppear()
    {
        userRepository.fetchUser { user in
            self.userInfo = user
        }
        cardRepository.fetchCard { cards in
            self.cardsInfo = cards
        }
    }
    
    func login(email: String, password: String)
    {
        Auth.auth().signIn(withEmail: email, password: password) { res, error in
            if let error = error
            {
                print("Failed to sign in due to ", error.localizedDescription)
            }
        }
    }
    
    func registerUser(username: String, email: String, password: String)
    {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error
            {
                print("Failed to register user due to ", error.localizedDescription)
            }
            
            guard let uid = result?.user.uid else
            {
                return
            }
            
            let db = Firestore.firestore()
            db.collection("Users").document(uid).setData([ "Username" : username,
                                                           "Email" : email
                                                         ]
            ) { error in
                if error != nil {
                    self.errorMsg = error!.localizedDescription
                    return
                }
            }
        }
    }
}
