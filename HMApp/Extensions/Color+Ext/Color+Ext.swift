//
//  UIColor+Ext.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 15.01.2022.
//

import SwiftUI

extension Color{
    
    static func rgb(red:CGFloat, green: CGFloat, blue: CGFloat) -> Color{
        return Color(red: red/255, green: green/255, blue: blue/255)
    }
    
    static let mainDarkBlueBackgroundColor = Color(red: 1/255, green: 25/255, blue: 32/255)
    
    static let cardBackgroundColor = Color(red: 1/255, green: 35/255, blue: 45/255)
    
    static let fieldsMainGreenColor = Color(red: 5/255, green: 205/255, blue: 165/255)
    
}

extension UIColor {
    static let mainDarkBlueBackgroundColor = UIColor(red: 1/255, green: 25/255, blue: 32/255, alpha: 1)
}
