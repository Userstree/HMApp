//
//  Download.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 28.03.2022.
//

import SwiftUI

struct Download: Identifiable {
    var id = UUID().uuidString
    var downloads: CGFloat
    var weekday: String
}

var downloads: [Download] = [
    Download(downloads: 224, weekday: "Mon"),
    Download(downloads: 142, weekday: "Tue"),
    Download(downloads: 222, weekday: "Wed"),
    Download(downloads: 94, weekday: "Thu"),
    Download(downloads: 113, weekday: "Fri"),
    Download(downloads: 104, weekday: "Sat"),
    Download(downloads: 120, weekday: "Sun")
]

