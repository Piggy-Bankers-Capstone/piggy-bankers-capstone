//
//  ActiveUserView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct ActiveUserView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var defaultView = "Profile"
    
    var body: some View {
        TabView(selection: $defaultView) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("Home")
            
            KidsView()
                .tabItem {
                    Label("Kids", systemImage: "person.2")
                }
                .tag("Kids")
            
            ProfileView()
                
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag("Profile")
        }
        .environmentObject(userManager)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                Menu {
                    Button("Update User Info") { }
                    Button("Create Kid") { }
                    Button("Create Transaction") { }
                    Button("Settings...") { }
                    Button("Sign Out", role: .destructive) { }
                } label: {
                    Label("", systemImage: "gearshape.fill")
                }
            }
        }
    }
}

struct ActiveUserView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveUserView()
            .environmentObject(UserManager())
    }
}
