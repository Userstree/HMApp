//
//  ContentView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 15.01.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage("log_Status") var log_Status = false
    @EnvironmentObject var createAccount: ManageAccount
    
    var body: some View {
        ZStack{
            if log_Status {
                NavigationView {
                    VStack {
                        Text("HERE")
                        
                        Button("Logout") {
                            log_Status = false
                        }
                    }
                }
            } else {
                Welcome()
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ManageAccount())
        }
    }
}
#endif
