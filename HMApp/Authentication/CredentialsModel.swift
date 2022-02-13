//
//  CredentialsModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 08.02.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Credentials: Codable {
    @DocumentID var id: String?
    var email: String
    var password: String
}

class Authentication: ObservableObject {
    @Published var credentials: Credentials?
    @Published var showProgressView = false
    
    var loginDisabled: Bool {
        (credentials?.email.isEmpty)! || ((credentials?.password.isEmpty) != nil)
    }
    
    func login(completion: @escaping (Bool) -> ()) {
        showProgressView = true
        
    }
    
}
