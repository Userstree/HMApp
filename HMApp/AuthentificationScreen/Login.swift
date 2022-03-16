//
//  Login.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 25.01.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var index: Int
    
    @EnvironmentObject var homeViewModel: UserDetailsViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.fieldsMainGreenColor : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextArea(placeholder: "Email", text: $email, isSecureEntry: false)
                            .frame(height: 20)
                            .foregroundColor(Color.white)
                    }
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    Field(text: $password )
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
            }
            .padding()
            .padding(.bottom, 50)
            .background(Color.cardBackgroundColor)
            .clipShape(Cshape())
            .contentShape(Cshape())
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                homeViewModel.login(email: email, password: password)
                
                ContentView().log_Status = true
            }) {
                Text("Login")
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
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

#if DEBUG
struct Welcome_Preview: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
#endif
