//
//  AddKidView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import SwiftUI

struct AddKidView: View {
    @EnvironmentObject var userManager: UserManager
    @Binding var kids: [Kid]
    @Binding var isAddingKid: Bool
    
    @State var showingError = false
    @State private var newKidName = ""
    @State private var newKidBalance = ""

    var body: some View {
        VStack {
            TextField("Kid name", text: $newKidName)
                .multilineTextAlignment(.center)
            
            TextField("Total balance", text: $newKidBalance)
                .multilineTextAlignment(.center)
            
            Button(action: {
                if self.kids.contains(where: { $0.kid_name == self.newKidName }) {
                    self.showingError = true
                } else if let balance = Double(self.newKidBalance) {
                    self.kids.append(Kid(kid_name: self.newKidName, total_balance: balance, goals: []))
                }
                self.isAddingKid = false
            }) {
                Text("Add Kid")
            }
            .alert(isPresented: $showingError) {
                Alert(title: Text("Error"), message: Text("A kid with that name already exists"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddKidView_Previews: PreviewProvider {
    static var previews: some View {
        AddKidView(kids: .constant([Kid(kid_name: "Elijah", total_balance: 999.9), Kid(kid_name: "jonah", total_balance: 999.8)]), isAddingKid: .constant(true))
            .environmentObject(UserManager())
    }
}
