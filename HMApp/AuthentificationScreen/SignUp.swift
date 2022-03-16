//
//  SignUp.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 25.01.2022.
//

import SwiftUI

struct SignUp: View
{
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @Binding var index: Int
    @EnvironmentObject var viewModel: UserDetailsViewModel
    
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            VStack
            {
                HStack
                {
                    Spacer(minLength: 0)
            
                    VStack(spacing: 10)
                    {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.fieldsMainGreenColor : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack
                {
                    HStack(spacing: 15) {
                        Image(systemName: "person.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextArea(placeholder: "Username", text: $username, isSecureEntry: false)
                            .frame(height: 20)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack
                {
                    HStack(spacing: 15)
                    {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
    
                        TextArea(placeholder: "Email", text: $email, isSecureEntry: false)
                            .frame(height: 20)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack
                {
                    Field(text: $password)
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
            }
            .padding()
            .padding(.bottom, 50)
            .background(Color.cardBackgroundColor)
            .clipShape(Cshape1())
            .contentShape(Cshape1())
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                viewModel.registerUser(username: username, email: email, password: password)
                self.index = 0
                }
            ) {
                Text("Register")
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .clipShape(Capsule())
                    .padding(.horizontal, 50)
                    .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
                
            }
            .background(Color.fieldsMainGreenColor)
            .cornerRadius(30)
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
