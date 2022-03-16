//
//  UserModel.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 27.02.2022.
//

import Foundation
import UIKit

struct User: Codable, Identifiable {
    var id = UUID().uuidString
    var username: String
    var image: Data
    
    public init(username: String, image: UIImage){
        self.username = username
        self.image = image.pngData()!
    }
}
