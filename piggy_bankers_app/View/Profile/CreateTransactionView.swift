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
        VStack {
                
            TextField("How much?", value: $amount, format: .currency(code: "USD"))
            
            TextField("Description", text: $description, axis: .vertical)
                .lineLimit(3...)
            
            if let kids = userManager.user_kids {
                HStack {
                    Text("Select a child.")
                    
                    Picker("Select a child.", selection: $kid_name) {
                        ForEach(kids, id: \.kid_name) { kid in
                            Text("\(kid.kid_name)")
                                .tag(kid.kid_name)
                        }
                    }
                }
            }
            
            Section {
                Button {
                    userManager.fundTransaction(name: kid_name, amount: amount)
                    print("transaction initiated.")
                    
                } label: {
                    Text("Submit")
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
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
