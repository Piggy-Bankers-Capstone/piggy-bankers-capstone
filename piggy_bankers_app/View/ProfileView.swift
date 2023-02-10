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
//        let _ = userManager.fetchKids()
        NavigationStack {
            List {
                ForEach(transactionManager.transactions, id:\.id) { transaction in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(NumberFormatter.localizedString(from: transaction.transaction_amount as NSNumber, number: .currency))")
                                .foregroundColor(transaction.transaction_type == "Sent" ? .green : .red)
                            Text("\(transaction.transaction_memo)")
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("\(transaction.transaction_date)")
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
