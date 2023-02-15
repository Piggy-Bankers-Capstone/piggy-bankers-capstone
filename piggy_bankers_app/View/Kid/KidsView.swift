//
//  KidView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct KidsView: View {
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var kidManager: KidManager = KidManager()
    @State var kids: [Kid] = []
    @State var isAddingKid = false
    
    var body: some View {
        NavigationView {
            List(kidManager.kids) { kid in
                NavigationLink(destination: KidDetailsView(kid: kid)) {
                    HStack {
                        Text(kid.kid_name)
                        Spacer()
                        Text("$\(kid.total_balance, specifier: "%.2f")")
                    }
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



struct KidView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
