//
//  ThingSpeakRepository.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 20.04.2022.
//

import Foundation

let apiURL = "https://api.thingspeak.com/channels/1701186/feeds.json?api_key=9X750M1G5IXANZ1C&results=2"

protocol NetworkProtocol {
    func getData(url: String)
}

final class Network: NetworkProtocol {
   
    func getData(url: String) {
//        let decoder
    }
    
}
