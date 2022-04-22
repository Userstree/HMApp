//
//  Sensors.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 20.04.2022.
//

import Foundation

struct Sensors: Codable {
    var channel: Channel
    var feeds: [Feed]?
}

struct Channel: Codable {
    var field1, field2, field3, field4: String
}

struct Feed: Codable {
    var created_at: String
    var entry_id: Int
    var field1, field2, field3, field4: String?
}
