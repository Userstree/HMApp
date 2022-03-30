//
//  Card.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 11.03.2022.
//

import UIKit

class Card: Codable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name && lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    var image: String
    var name: String
    
    public init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}
