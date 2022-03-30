//
//  HomeView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 27.01.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct HomeView: View {
    @EnvironmentObject var accountData: UserDetailsViewModel
    
    var body: some View
    {
        VStack
        {
            UserInfoTop(
                color: Color.white ,
                data: accountData.userInfo ?? User(username: "Loading", image: UIImage(systemName: "photo.circle")!)
            )
            .padding()
            
            Section(header:
                        Text("Readings")
                            .padding(.leading, -180)
                            .foregroundColor(Color.white)
            ){
                CustomCardsScroll(images: accountData.cardsInfo
                                  ??
                                  [Card(image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg", name: "two")]
                )
            }
            Spacer()
        }
        .onAppear {
            accountData.onAppear()
        }
        .background(Color.mainDarkBlueBackgroundColor.ignoresSafeArea())
        .navigationBarTitle(Text("Home Page"))//, displayMode: .inline)
        .toolbar {
            ToolbarItem {
                Button(
                    action: {
                        withAnimation(.easeOut(duration: 0.43))
                        {
                            ContentView().log_Status = false
                            do {
                                try Auth.auth().signOut()
                            }
                            catch let signOutError as NSError {
                                print("Error signing out ", signOutError)
                            }
                        }
                    }
                ) {
                    Text("Log out")
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}


#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserDetailsViewModel())
            .preferredColorScheme(.dark)
    }
}
#endif

