//
//  CreateTransactionView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/1/23.
//

import SwiftUI

struct CreateTransactionView: View {
    @EnvironmentObject var userManager: UserManager
    @Environment(\.dismiss) var dismiss
    
    @State private var amount: Double = 0.0
    @State private var description: String = "This is the default description for sending/requesting money."
    @State private var kid_name: String = ""
    
    var body: some View {
        Form {
                
            TextField("How much?", value: $amount, format: .currency(code: "USD"))
            
            TextField("Description", text: $description, axis: .vertical)
                .lineLimit(3...)
            
            Picker("Select a child.", selection: $kid_name) {
                ForEach(testKids, id: \.kid_name) { kid in
                    Text("\(kid.kid_name)")
                        .tag(kid.kid_name)
                }
            }
            
            Section {
                Button {
                    userManager.fundTransaction(name: kid_name, amount: amount)
                    print("transaction initiated.")
                    
                } label: {
                    Text("Submit")
                }
            }
        }
        .padding()
    }
}

struct CreateTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView()
            .environmentObject(UserManager())
    }
}
