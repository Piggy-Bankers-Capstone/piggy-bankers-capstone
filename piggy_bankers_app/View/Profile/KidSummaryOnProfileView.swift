//
//  KidSummaryOnProfileView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import SwiftUI

struct KidSummaryOnProfileView: View {
    @EnvironmentObject var userManager: UserManager
    let kid: Kid
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(kid.kid_name)")
                    .font(.system(size: 16))
                    .italic()
                
                Text("\(kid.total_balance, format: .currency(code: "USD"))")
                    .foregroundColor(kid.total_balance < 0 ? .red : .black)
                    .bold()
                    .font(.system(size: 16))
            }
            
            Spacer()
            
            NavigationLink {
                Text("transfer")
            } label: {
                Label("", systemImage: "arrow.left.arrow.right")
                    .foregroundColor(.blue)
                    .font(.system(size: 24))
            }
            
            NavigationLink {
                Text("details")
            } label: {
                Label("", systemImage: "list.dash")
                    .foregroundColor(.gray)
                    .font(.system(size: 24))
            }
        }
    }
}

struct KidSummaryOnProfileView_Previews: PreviewProvider {
    static var previews: some View {
        KidSummaryOnProfileView(kid: Kid(kid_name: "mitch", total_balance: 77.7))
            .environmentObject(UserManager())
    }
}
