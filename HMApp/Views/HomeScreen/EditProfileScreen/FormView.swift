//
//  FormView.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 30.03.2022.
//

import SwiftUI

struct FormView: View {
    @State var notifyMeAbout: String = ""
    @State var playNotificationSounds: Bool = false
    @State var profileImageSize: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages")
                        Text("Mentions")
                        Text("Anything")
                    }
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                }
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        Text("Large")
                        Text("Medium")
                        Text("Small")
                    }
                    Button("Clear Image Cache") {}
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(notifyMeAbout: "This", playNotificationSounds: true, profileImageSize: "Big")
    }
}
