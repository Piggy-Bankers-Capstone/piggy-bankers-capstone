//
//  KidDetailsView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import SwiftUI

struct KidDetailsView: View {
    @EnvironmentObject var userManager: UserManager
    
    @State var kid: Kid
    @State private var newGoalName = ""
    @State private var newGoalAmount = ""
    @State private var newGoalTotalNeeded = ""
    @State private var showDuplicateError = false
    @State private var showGoalEditor = false

    var body: some View {
        VStack {
            Text(kid.kid_name)
            Text("$\(kid.total_balance, specifier: "%.2f")")
            List {
                ForEach(kid.goals) { goal in
                    HStack {
                        Button(action: {
                            self.newGoalName = goal.goal_name
                            self.newGoalAmount = String(goal.goal_amount)
                            self.showGoalEditor = true
                        }) {
                            Image(systemName: "square.and.pencil")
                        }
                        .sheet(isPresented: $showGoalEditor) {
                            GoalEditorView(goal: self.$kid.goals[self.kid.goals.firstIndex(where: { $0.id == goal.id })!])
                        }
                    }
                }
            }
            VStack {
                TextField("Goal name", text: $newGoalName)
                TextField("Goal amount", text: $newGoalAmount)
                TextField("Total needed", text: $newGoalTotalNeeded)
                Button(action: {
                    guard let goalAmount = Double(newGoalAmount), goalAmount <= self.kid.total_balance else { return }
                    guard let goalTotalNeeded = Double(newGoalTotalNeeded), goalTotalNeeded >= goalAmount else { return }
                    if self.kid.goals.contains(where: { $0.goal_name == self.newGoalName }) {
                        self.showDuplicateError = true
                        return
                    }
                    self.kid.goals.append(Goal(goal_name: self.newGoalName, goal_amount: goalAmount))
                }) {
                    Text("Add Goal")
                }
            }.padding()
            .alert(isPresented: $showDuplicateError) {
                Alert(title: Text("Duplicate Goal"), message: Text("A goal with the same name already exists"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct KidDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        KidDetailsView(kid: Kid(kid_name: "elijah", total_balance: 999.9))
            .environmentObject(UserManager())
    }
}
