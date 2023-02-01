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
        NavigationView {
            VStack {
                ProfileHeader()
                
                NavigationLink {
                    // Add kid view
                    
                } label: {
                    Text("Add Kid")
                }
                
                if let kids = userManager.user_kids {
                    List(kids, id: \.kid_name) { kid in
                        KidSummaryOnProfileView(kid: kid)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                    }
//                    DisclosureGroup(
//                        isExpanded: $kidsDisclosure,
//                        content: {
//                            ForEach(kids, id: \.kid_name) { kid in
//                                KidSummaryOnProfileView(kid: kid)
//                                    .padding(.vertical, 4)
//                                    .padding(.horizontal, 10)
//                            }
//                        },
//                        label: {
//                            Text("\(kidsDisclosure ? "Hide" : "Show") my kids")
//                                .foregroundColor(.black)
//                        }
//                    )
                    .padding(.vertical, 20)
//                    .accentColor(Color(UIColor.systemGroupedBackground))
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
