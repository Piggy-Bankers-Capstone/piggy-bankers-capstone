//
//  KidView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct KidsView: View {
    @EnvironmentObject var userManager: UserManager
    @State var kids: [Kid] = []
    @State var isAddingKid = false

    
    var body: some View {
        NavigationView {
            List(kids) { kid in
                HStack{
                    Text(kid.kid_name);
                    Spacer();
                    Text("$\(kid.total_balance, specifier: "%.2f")");
                }
            }
            .navigationBarTitle("Kids")
            .navigationBarItems(trailing:
                                    Button(action: {
                self.isAddingKid = true
            }) {
                Image(systemName: "plus")
            }
            )
        }
        .sheet(isPresented: $isAddingKid) {
            AddKidView(kids: self.$kids, isAddingKid: self.$isAddingKid)
        }
    }
}


struct AddKidView: View {
    @Binding var kids: [Kid]
    @Binding var isAddingKid: Bool
    @State var showingError = false

    var body: some View {
        VStack {
            TextField("Kid name", text: $newKidName).multilineTextAlignment(.center)
            TextField("Total balance", text: $newKidBalance).multilineTextAlignment(.center)
            Button(action: {
                if self.kids.contains(where: { $0.kid_name == self.newKidName }) {
                    self.showingError = true
                } else if let balance = Double(self.newKidBalance) {
                    self.kids.append(Kid(kid_name: self.newKidName, total_balance: balance))
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
    @State private var newKidName = ""
    @State private var newKidBalance = ""
}
       

struct Kid: Identifiable {
    let id = UUID()
    let kid_name: String
    let total_balance: Double
}


struct KidView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
