//
//  ProfileView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var transactionManager = TransactionManager()
    
    var body: some View {
        VStack {
            ProfileHeader(transactionManager: transactionManager)
                .padding([.vertical], 20)
            
            NavigationStack {
                List {
                    ForEach(transactionManager.transactions, id:\.id) { transaction in
                        NavigationLink {
                            TransactionDetails(transaction: transaction)
                        } label: {
                            AllTransactionsRow(transaction: transaction)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
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
