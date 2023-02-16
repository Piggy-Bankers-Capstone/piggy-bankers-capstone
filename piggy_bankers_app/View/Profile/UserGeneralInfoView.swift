//
//  UserGeneralInfoView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/16/23.
//

import SwiftUI

struct UserGeneralInfoView: View {
    
    struct tempUser {
        let id = "1sfe2gsg3sdfs4jgf5"
        let first_name = "bob"
        let last_name = "smith"
        let email = "bob@email.com"
        let password = "password1"
        let kids = ["kid1", "kid2", "kid3"]
    }
    
    let tempActiveUser = tempUser()
    
    var body: some View {
        Form {
            Section("Personal Info") {
                Text("ID: \(tempActiveUser.id)")
                Text("First Name: \(tempActiveUser.first_name)")
                Text("Last Name: \(tempActiveUser.last_name)")
                Text("Email: \(tempActiveUser.email)")
                Text("First Name: \(tempActiveUser.password)")
            }
            
            Section("Kids") {
                List (tempActiveUser.kids, id:\.self) { kid in
                    Text("\(kid)")
                }
            }
        }
    }
}

struct UserGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserGeneralInfoView()
    }
}
