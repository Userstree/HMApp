//
//  CardContent.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 13.03.2022.
//

import SwiftUI

struct CardContent: View {
    var data: Card
    @EnvironmentObject var user: UserDetailsViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            
            HStack {
                Button{
                    
                }
                label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.white)
                }
                Text("Home")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                Spacer()
                VStack {
                    Spacer()
                    Text(user.userInfo?.username ?? "Username")
                        .foregroundColor(.white)
                        .font(.title3)
                    Spacer()
                }
                AsyncImage(url: URL(string: data.image))
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
            }
            .padding()
        }
        .background(Color.mainDarkBlueBackgroundColor.ignoresSafeArea())
        .onAppear {
            user.onAppear()
        }
    }
}

struct CardContent_Previews: PreviewProvider {
    static var previews: some View {
        CardContent(data: Card(image: "https://photoscissors.com/images/samples/3-before.jpg", name: "name"))
            .environmentObject(UserDetailsViewModel())
    }
}
