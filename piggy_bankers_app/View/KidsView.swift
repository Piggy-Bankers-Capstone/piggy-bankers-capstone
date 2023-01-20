//
//  KidView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct KidsView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Text("kids view")
    }
}

struct KidView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
