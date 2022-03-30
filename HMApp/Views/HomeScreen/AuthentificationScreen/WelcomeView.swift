//
//  WelcomeView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 24.01.2022.
//

import SwiftUI

struct WelcomeView: View
{
    var body: some View
    {
        Welcome()
    }
}

struct Welcome: View
{
    @State var index: Int = 0
    
    var body: some View
    {
        GeometryReader
        { _ in
            VStack
            {
                Image("caduceus_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 75)
                
                ZStack
                {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                }
                
                HStack(spacing: 15)
                {
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
                
                HStack
                {
                    Button(
                        action:
                            {
                        
                        }
                    ) {
                        Image("apple_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .colorInvert().opacity(0.95)
                    }
                    
                    Button(
                        action:
                            {
                        
                            }
                    ) {
                        Image("instagram_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal, 20)
                    
                    Button(
                        action: {
                        
                        }
                    ) {
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

