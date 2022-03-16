//
//  CardRepository.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 11.03.2022.
//

import FirebaseStorage
import FirebaseFirestore
import SwiftUI

protocol CardRepositoryProtocol {
    func fetchCard(completion: @escaping ([Card]) -> Void)
}

class CardRepository: CardRepositoryProtocol {
    func fetchCard(completion: @escaping ([Card]) -> Void) {
        var cards: [Card] = []
        Firestore.firestore().collection("cardImages").document("images").addSnapshotListener { snapshot, error in
            guard let document = snapshot?.data() else {
                print("Error fetching data for card")
                return
            }
            
            DispatchQueue.main.async {
                for file in document {
                    let imageUrl = file.value as! String
                    cards.append(Card(image: imageUrl, name: file.key))
                }
                completion(cards)
            }
        }
    }
}

