//
//  HomeView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 27.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var accountData: ManageAccount
    
    var body: some View {
        VStack {
            
            HStack {
                if accountData.isLoaded {
                    Image(uiImage: accountData.userImg!)
                } else {
                    Text("Image is loading")
                }
                VStack {
                    Text("Good morning")
                    Text("Name Surname")
                }
            }
            
            NavigationView {
                ScrollView {
                    
                    LazyVStack {
                        ForEach(1..<10) { _ in
//                            CellContent()
                        }
                    }
                    
                }
            }
            
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ManageAccount())
    }
}
#endif
