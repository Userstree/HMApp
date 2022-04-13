//
//  ViewRepresentable+Ext.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 26.01.2022.
//

import SwiftUI

struct Field: View {
    
    @Binding var isSecured: Bool
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            
            Button (action: {
                isSecured.toggle()
            }){
                Image(systemName: self.isSecured ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(Color.fieldsMainGreenColor)
            }
            TextArea(placeholder: "Password", text: self.$text, isSecureEntry: $isSecured)
                .frame(height: 20)
        }
    }
}

struct TextArea: UIViewRepresentable {
    
    @State var placeholder: String
    @Binding var isSecureTextEntry: Bool
    
    @Binding var text: String

    init(placeholder: String, text: Binding<String>, isSecureEntry isSecureTextEntry: Binding<Bool>) {
        self._text = text
        self._isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
    }
    
    func makeUIView(context: Context) -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.delegate = context.coordinator
        let placeholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.gray])
        tf.attributedPlaceholder = placeholder
        tf.textColor = .white
        tf.isSecureTextEntry = isSecureTextEntry
        tf.clearsOnBeginEditing = false
        return tf
    }
    
    func updateUIView(_ textView: UITextField, context: Context) {
        if !text.isEmpty{
            textView.text = text
            textView.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextArea
        
        init(_ textField: TextArea) {
            self.parent = textField
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard textField.markedTextRange == nil, parent.text != textField.text else {
                return
            }
            parent.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
