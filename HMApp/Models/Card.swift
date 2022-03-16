//
//  Card.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 11.03.2022.
//

import UIKit

class Card: Codable, Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var name: String
    
    public init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}
