//
//  ViewRepresentable+Ext.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 26.01.2022.
//

import SwiftUI

struct Field: View {
    
    @State private var isSecured: Bool = false
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            
            Button (action: {
                isSecured.toggle()
            }){
                Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                .foregroundColor(Color.fieldsMainGreenColor)
            }
            
            if isSecured {
                TextArea(placeholder: "Password", text: self.$text, isSecureEntry: false)
                    .frame(height: 20)
                
            } else {
                TextArea(placeholder: "Password", text: self.$text, isSecureEntry: true)
                    .frame(height: 20)
            }
            
        }
    }
}

struct TextArea: UIViewRepresentable {
    
    @State var placeholder: String
    @Binding var text: String
    var isSecureTextEntry: Bool
    
    init(placeholder: String, text: Binding<String>, isSecureEntry isSecureTextEntry: Bool) {
        self._text = text
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textView = getTextfield()
        return textView
    }
    
    func getTextfield() -> UITextField {
        let tf = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.gray])
        tf.attributedPlaceholder = placeholder
        tf.textColor = .white
        tf.isSecureTextEntry = isSecureTextEntry
        tf.clearsOnBeginEditing = false
        return tf
    }
    
    func updateUIView(_ textView: UITextField, context: Context) {
        if !text.isEmpty {
            textView.text = text
        }
    }
    
}

