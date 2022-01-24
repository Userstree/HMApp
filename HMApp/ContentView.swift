//
//  ContentView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 15.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            ContentView()
            
        }
    }
}

struct Home: View {
    @State var index: Int = 0
    
    var body: some View {
        
        GeometryReader { _ in
            
            VStack {
                
                Image("caduceus_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 75)
                
                ZStack {
                    
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                }
                
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                    
                    Text("OR")
                        .foregroundColor(Color.white)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                }
                .padding(.top, 50)
                .padding(.horizontal, 15)
                
                HStack {
                    
                    Button(action: {}) {
                        
                        Image("apple_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .colorInvert().opacity(0.95)
                    }
                    
                    Button(action: {}) {
                        
                        Image("instagram_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {}) {
                        
                        Image("google_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .padding(.all, 15)
                .background(Color.cardBackgroundColor)
                .cornerRadius(40)
                .offset(y: 20)
                
            }
            .padding()
            
        }
        .background(Color.mainDarkBlueBackgroundColor).edgesIgnoringSafeArea(.all)
        
    }
}

struct Cshape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
    
}

struct Cshape1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
    
}

struct Login: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @Binding var index: Int
    
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
                        
                        TextField("Email", text: self.$email)
                            .foregroundColor(Color.white)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextField("Password", text: self.$password)
                            .foregroundColor(Color.white)
                    }
                    
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
            
            Button(action: {}) {
                
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

struct SignUp: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @Binding var index: Int
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                
                HStack {
                    
                    Spacer(minLength: 0)
            
                    VStack(spacing: 10) {
                        
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
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "person.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextField("Username", text: self.$username)
                            .foregroundColor(Color.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextField("Email", text: self.$email)
                            .foregroundColor(Color.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.fieldsMainGreenColor)
                        
                        TextField("Password", text: self.$password)
                            .foregroundColor(Color.white)
                        
                    }
                    
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
            
            Button(action: {}) {
                
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
