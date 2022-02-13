//
//  LoadingScreen.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 30.01.2022.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        
        ZStack {
            Color(.systemBackground).ignoresSafeArea().opacity(0.5)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .scaleEffect(3)
        }
        
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
