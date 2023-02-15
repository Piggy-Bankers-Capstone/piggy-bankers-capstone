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
            ProfileHeader()
                .padding([.top], 20)
            
            HStack {
                NavigationLink {
                    CreateTransactionView(transactionManager: transactionManager)
                } label: {
                    Text("Create Transaction")
                }
                
                Spacer()
                
                Button {
                    transactionManager.refreshTransactions()
                } label: {
                    Label("", systemImage: "arrow.triangle.2.circlepath")
                }
            }
            .padding()
            
            Divider()
            
            if let transactions = transactionManager.transactions {
                List(transactions) { transaction in
                    AllTransactionsRow(transaction: transaction)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .listStyle(.plain)
            } else {
                Text("No transactions were found.")
            }
        }
        //.environmentObject(transactionManager)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
