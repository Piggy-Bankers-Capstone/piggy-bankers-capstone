//
//  TransactionDetails.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/10/23.
//

import SwiftUI

struct TransactionDetails: View {
    let transaction: Transaction
    
    var body: some View {
        Form {
            Section("Transaction Details") {
                Text("ID: \(transaction.id)")
                    .lineLimit(0)
                HStack {
                    Text("Household: \(transaction.household_id)")
                    Text("Profile: \(transaction.profile_id)")
                }
                Text("\(transaction.transaction_date.formatted(.dateTime.day().month().year()))")
                Text("Type: \(transaction.transaction_type)")
                Text("\(NumberFormatter.localizedString(from: transaction.transaction_amount as NSNumber, number: .currency))")
                    .foregroundColor(transaction.transaction_type == "Sent" ? .green : .red)
            }
            
            Section("Memo") {
                Text("\(transaction.transaction_memo)")
            }
            
            Section("Description") {
                Text("\(transaction.transaction_description)")
            }
        }
    }
}

struct TransactionDetails_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetails(transaction: Transaction())
    }
}
