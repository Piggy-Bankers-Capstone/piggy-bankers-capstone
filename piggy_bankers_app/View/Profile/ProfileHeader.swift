//
//  ProfileHeader.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import SwiftUI

struct ProfileHeader: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .clipped()
                    .padding(4)
                    .overlay(Circle().stroke(.blue, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text("\(userManager.firstName == "" ? "user's name" : userManager.firstName)")
                        .font(.system(size: 24))
                        .bold()
                    Text("\(userManager.username == "" ? "user's username" : userManager.username)")
                        .font(.system(size: 16))
                        .italic()
                }
            }
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
            .environmentObject(UserManager())
    }
}
