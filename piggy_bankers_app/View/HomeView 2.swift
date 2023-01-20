//
//  HomeView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Text("home view")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
