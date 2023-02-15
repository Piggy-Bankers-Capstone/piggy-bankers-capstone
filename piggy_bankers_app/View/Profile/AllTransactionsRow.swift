//
//  AllTransactionsRow.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/10/23.
//

import SwiftUI

struct AllTransactionsRow: View {
    let transaction: Transaction
    
    var body: some View {
        NavigationLink {
            TransactionDetails(transaction: transaction)
        } label: {
            HStack() {
                KidProfileTag(profile_id: String(transaction.profile_id))
                
                VStack(alignment: .leading) {
                    Text("\(NumberFormatter.localizedString(from: transaction.transaction_amount as NSNumber, number: .currency))")
                        .foregroundColor(transaction.transaction_type == "Sent" ? .green : .red)
                    Text("\(transaction.transaction_memo)")
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(transaction.transaction_date.formatted(.dateTime.day().month().year()))")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct AllTransactionsRow_Previews: PreviewProvider {
    static var previews: some View {
        AllTransactionsRow(transaction: Transaction())
    }
}
