//
//  CreateTransactionView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/1/23.
//

import SwiftUI

struct CreateTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var transactionManager = TransactionManager()
    @State private var newTransaction = Transaction()
    
    private let dummyKids = [100,101,102,103,104,105]
    
    var body: some View {
        Form {
            Section("Placeholder") {
                Text("ID placeholder")
                    .lineLimit(0)
                HStack {
                    Text("Household placeholder")
                    Text("Profile placeholder")
                }
            }
            
            Section("Details") {
                Text("Date: \(Date())")
                
                TextField("How much?", value: $newTransaction.transaction_amount, format: .currency(code: "USD"))
                
                TextField("Send or Request?", text: $newTransaction.transaction_type)
            }
            
            Section {
                TextField("Memo", text: $newTransaction.transaction_memo)
            }
            
            Section {
                TextField("Description", text: $newTransaction.transaction_description)
            }
            
            Picker("Select a child.", selection: $newTransaction.profile_id) {
                ForEach(dummyKids, id: \.self) { kid in
                    Text("\(kid)")
                        .tag(kid)
                }
            }
            
            Section {
                Button {
                    transactionManager.createTransaction(transaction: newTransaction)
                    transactionManager.refreshTransactions()
                } label: {
                    Text("Submit")
                }
            }
        }
        .padding()
    }
}

//struct CreateTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTransactionView(, transactionManager: <#TransactionManager#>)
//    }
//}
