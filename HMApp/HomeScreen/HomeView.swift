//
//  HomeView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 27.01.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Image("")
                    .clipShape(Circle())
                VStack {
                    Text("Good morning")
                    Text("Name Surname")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
