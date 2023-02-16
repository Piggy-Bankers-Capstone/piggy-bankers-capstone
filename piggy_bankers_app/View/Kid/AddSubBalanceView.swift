//
//  AddSubBalanceView.swift
//  piggy_bankers_app
//
//  Created by Elijah McKay on 2/16/23.
//

import SwiftUI

struct AddSubBalanceView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var kid: Kid
    
    @State private var newSubBalanceName = ""
    @State private var newSubBalanceAmount = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sub-balance Details")) {
                    TextField("Name", text: $newSubBalanceName)
                    TextField("Amount", text: $newSubBalanceAmount)
                        .keyboardType(.decimalPad)
                }
                
                Button("Save") {
                    guard let amount = Double(newSubBalanceAmount) else { return }
                    let subBalance = SubBalance(kid_id: 1, name: newSubBalanceName, balance: amount)
                    kid.sub_balances.append(subBalance)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add Sub-balance")
        }
    }
}

struct AddSubBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        let kid = Kid(kid_name: "Elijah", total_balance: 999.9, sub_balances: [])
        return AddSubBalanceView(kid: .constant(kid))
    }
}


