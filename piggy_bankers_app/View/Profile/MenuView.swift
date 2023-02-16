//
//  MenuView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/16/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
