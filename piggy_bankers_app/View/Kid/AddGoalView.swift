//
//  AddGoalView.swift
//  piggy_bankers_app
//
//  Created by Elijah McKay on 2/16/23.
//

import SwiftUI

struct AddGoalView: View {
    @State private var newGoalName: String = ""
    @State private var newGoalBalance: String = ""
    @State private var newGoalTotalNeeded: String = ""
    @State private var showDuplicateError: Bool = false

    @Binding var kid: Kid

    var body: some View {
        VStack {
            TextField("Goal name", text: $newGoalName)
            TextField("Goal amount", text: $newGoalBalance)
            TextField("Total needed", text: $newGoalTotalNeeded)
            Button(action: {
                guard let goalBalance = Double(newGoalBalance), goalBalance <= self.kid.total_balance else { return }
                guard let goalTotalNeeded = Double(newGoalTotalNeeded), goalTotalNeeded >= goalBalance else { return }
                if self.kid.goals.contains(where: { $0.goal_name == self.newGoalName }) {
                    self.showDuplicateError = true
                    return
                }
                self.kid.goals.append(Goal(goal_name: self.newGoalName, goal_balance: goalBalance, total_needed: goalTotalNeeded))
            }) {
                Text("Add Goal")
            }
        }.padding()
        .alert(isPresented: $showDuplicateError) {
            Alert(title: Text("Duplicate Goal"), message: Text("A goal with the same name already exists"), dismissButton: .default(Text("OK")))
        }
    }
}
