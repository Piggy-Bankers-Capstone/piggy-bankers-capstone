//
//  UserSettingsView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/15/23.
//

import SwiftUI

struct UserSettingsView: View {
    @State var notificationsAreOn: Bool = true
    
    var body: some View {
        Form {
            Section("Preferences") {
                NavigationLink {
                    UserGeneralInfoView()
                } label: {
                    Text("Account")
                }
                
                NavigationLink {
                    // payment methods view
                } label: {
                    Text("Payment Methods")
                }
                
                Toggle("Notifications", isOn: $notificationsAreOn)
                
                NavigationLink {
                    // notification settings view
                } label: {
                    Text("Notification Settings")
                }
                
                NavigationLink {
                    // all kid display
                } label: {
                    Text("Kids Dashboard")
                }
                
                NavigationLink {
                    // help page
                } label: {
                    Text("Get help")
                }
            }
            
            Section("Security") {
                NavigationLink {
                    UserChangePasswordView()
                } label: {
                    Text("Change Password")
                }
                
                NavigationLink {
                    // change pin view
                } label: {
                    Text("PIN")
                }
                
                NavigationLink {
                    // list of devices
                } label: {
                    Text("Devices")
                }
            }
            
            Section("Information") {
                NavigationLink {
                    // educational
                } label: {
                    Text("Kid Education")
                }
                
                NavigationLink {
                    // educational
                } label: {
                    Text("User Education")
                }
                
                NavigationLink {
                    // legal view
                } label: {
                    Text("Legal")
                }
                
                NavigationLink {
                    // general info view
                } label: {
                    Text("Helpful Information")
                }
            }
            
            Section {
                NavigationLink {
                    // rate Piggy view
                } label: {
                    Text("Rate Piggy")
                }
            }
            
            Section {
                Button("Sign Out", role: .destructive) { }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
