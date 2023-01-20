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
                .environmentObject(userManager)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("Home")
            
            KidsView()
                .environmentObject(userManager)
                .tabItem {
                    Label("Kids", systemImage: "person.2")
                }
                .tag("Kids")
            
            ProfileView()
                .environmentObject(userManager)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag("Profile")
        }
    }
}

struct ActiveUserView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveUserView()
            .environmentObject(UserManager())
    }
}
