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

    var body: some View {
        VStack {
            List {
                ForEach(kids, id: \.self) { kid in
                    HStack {
                        Text(kid.kid_name)
                        Spacer()
                        Text("$\(kid.total_balance)")
                    }
                }
            }
            VStack {
                TextField("Kid name", text: $newKidName)
                TextField("Total balance", text: $newKidBalance)
                Button(action: {
                    if self.kids.contains(where: { $0.kid_name == self.newKidName }) {
                        self.showingError = true
                    } else if let balance = Double(self.newKidBalance) {
                        self.kids.append(Kid(kid_name: self.newKidName, total_balance: balance))
                    }
                }) {
                    Text("Add Kid")
                }
                .alert(isPresented: $showingError) {
                    Alert(title: Text("Error"), message: Text("A kid with that name already exists"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    @State private var newKidName = ""
    @State private var newKidBalance = ""
    @State private var showingError = false
}

struct Kid: Hashable {
    var kid_name: String
    var total_balance: Double

    func hash(into hasher: inout Hasher) {
        hasher.combine(kid_name)
    }

    static func == (lhs: Kid, rhs: Kid) -> Bool {
        return lhs.kid_name == rhs.kid_name
    }
}


struct KidView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
