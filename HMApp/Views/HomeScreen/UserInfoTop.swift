//
//  UserInfoTop.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 13.03.2022.
//

import SwiftUI

struct UserInfoTop: View {
    var color: Color
    var data: User
    
    var body: some View {
        HStack {
                Image(uiImage: UIImage(data: data.image)!)
                    .resizable()
                    .foregroundColor(color)
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
            
                VStack {
                    Text("Good morning")
                    Text(data.username)
                }
                .foregroundColor(color)
            Spacer()
            Button(action: {}) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color)
            }
        }
        .background(Color.mainDarkBlueBackgroundColor)
    }
}

#if DEBUG
struct UserInfoTop_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoTop(color: Color.white, data: User(username: "Loading", image: UIImage(systemName: "photo.circle")!))
    }
}
#endif
