//
//  ProfileView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    
    @State private var kidsDisclosure: Bool = false
    
    var body: some View {
//        let _ = userManager.fetchKids()
        
        NavigationView {
            VStack {
                ProfileHeader()
                
                NavigationLink {
                    CreateTransactionView()
                        .environmentObject(userManager)
                } label: {
                    Text("Transfer Money")
                }
                .padding(.vertical, 20)
                
                if let kids = userManager.user_kids {
                    ForEach(kids, id: \.kid_name) { kid in
                        KidSummaryOnProfileView(kid: kid)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 0)
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserManager())
    }
}
