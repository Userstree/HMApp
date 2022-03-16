//
//  HomeView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 27.01.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

let colorNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    @EnvironmentObject var accountData: UserDetailsViewModel
//    @ObservedObject var cardsModel: CardViewModel
    
    init() {
//        self.cardsModel = cardsModel
        
        colorNavAppearance.configureWithOpaqueBackground()
        colorNavAppearance.backgroundColor = UIColor.mainDarkBlueBackgroundColor
        colorNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        colorNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               
        UINavigationBar.appearance().standardAppearance = colorNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorNavAppearance
    }
    
    var body: some View {
        NavigationView {
            VStack {
                UserInfoTop(
                    color: Color.white ,
                    data: accountData.userInfo ?? User(username: "Loading", image: UIImage(systemName: "photo.circle")!)
                )
                    .padding()
                
                CustomCardsScroll(images: accountData.cardsInfo
                                  ??
                                  [Card(image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg", name: "two")]
                )
                    
            }
                .onAppear {
                    accountData.onAppear()
                }
            .navigationBarTitle("Main", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            withAnimation(.easeOut(duration: 0.3)) {
                                ContentView().log_Status = false
                                do
                                {
                                    try Auth.auth().signOut()
                                }
                                catch let signOutError as NSError
                                {
                                    print("Error signing out ", signOutError)
                                }
                            }
                        }
                    ) {
                        Text("Log out")
                        .foregroundColor(Color.white)
                    }
            )
            .background(Color.mainDarkBlueBackgroundColor.ignoresSafeArea())
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

