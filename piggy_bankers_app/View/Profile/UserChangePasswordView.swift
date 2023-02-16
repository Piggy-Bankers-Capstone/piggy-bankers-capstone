//
//  UserChangePasswordView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/16/23.
//

import SwiftUI

struct UserChangePasswordView: View {
    @State var oldPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmNewPassword: String = ""
    
    var body: some View {
        Form {
            Section() {
                SecureField("Old Password", text: $oldPassword)
            }
            
            Section() {
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmNewPassword)
            }
            
            Button("Submit") { }
        }
    }
}

//struct UserChangePasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserChangePasswordView()
//    }
//}
