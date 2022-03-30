//
//  EditProfileScreen.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 29.03.2022.
//

import SwiftUI

struct EditProfileView: View {
    var data: User
//    @State var age: Int
    @State var username: String = ""
    var ageRange: [ClosedRange<Int>] = [1...100]
    var body: some View {
        ScrollView
        {
            VStack
            {
                Image(uiImage: UIImage(data: data.image)!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(75)
                    .overlay(
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .bottomLeading)
                            .foregroundColor(.white)
                    )
                    .frame(width: 180, height: 180)
            }
            
            VStack {
                HStack(spacing: 15)
                {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.fieldsMainGreenColor)
                    
                    TextArea(placeholder: data.username, text: $username, isSecureEntry: .constant(false))
                        .frame(height: 20)
                        .foregroundColor(Color.white)
                }
                Divider().background(Color.white.opacity(0.5))
            }
            .padding(.horizontal)
            .padding(.top, 40)
            
//            VStack
//            {
//                HStack
//                {
//                    Text("Age:")
//                        .foregroundColor(.white)
//                        .font(.custom("Times New Roman", size: 20))
//                        .fontWeight(.semibold)
//
//                    Picker(selection: $age) {
//                        ForEach(ageRange, id: \.self) { age in
//                            Text(ageRange[)
//                        }
//                    } label: {
//                        Text("Select")
//                    }
//
//                }
//            }
            
            VStack
            {
                HStack
                {
                    Text("Select gender:")
                        .foregroundColor(.white)
                        .font(.custom("Times New Roman", size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                    VStack
                    {
                        Button {}
                        label: {
                            Image("male-48")
                                .resizable()
                                .scaleEffect(0.75)
                                .frame(width: 80, height: 80)
                                .background(Color.cardBackgroundColor)
                                .cornerRadius(40)
                        }
                        Text("Male")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack
                    {
                        Button {}
                        label: {
                            Image("female-48")
                                .resizable()
                                .scaleEffect(0.75)
                                .frame(width: 80, height: 80)
                                .background(Color.cardBackgroundColor)
                                .cornerRadius(40)
                        }
                        Text("Female")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 30)
            
            Button(action: {})
            {
                Text("Save")
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .clipShape(Capsule())
                    .padding(.horizontal, 50)
                    .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .background(Color.fieldsMainGreenColor)
            .cornerRadius(30)
            .padding(.top, 30)

        }
        .background(Color.mainDarkBlueBackgroundColor.ignoresSafeArea())
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(data: User(username: "ARS", image: UIImage(systemName: "bell")!))
    }
}
