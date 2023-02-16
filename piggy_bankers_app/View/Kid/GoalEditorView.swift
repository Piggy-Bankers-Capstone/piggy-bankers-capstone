//
//  GoalEditorView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import SwiftUI

struct GoalEditorView: View {
    @Binding var goal: Goal
    @State private var showGoalEditor = false
    @State private var newGoalName = ""
    @State private var newGoalAmount = ""
    @State private var newGoalTotalNeeded = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("\(goal.goal_name)", text: $newGoalName)
                
                TextField("\(goal.goal_balance.description)", text: $newGoalAmount)
                
                TextField("\(goal.total_needed.description)", text: $newGoalTotalNeeded)
                
                Button(action: {
                    guard let goalBalance = Double(newGoalAmount), goalBalance <= self.goal.total_needed else { return }
                    guard let goalTotalNeeded = Double(newGoalTotalNeeded), goalTotalNeeded >= goalBalance else { return }
                    self.goal = Goal(goal_name: self.newGoalName, goal_balance: goalBalance, total_needed: goalTotalNeeded)
                    self.showGoalEditor = false
                }) {
                    Text("Save")
                }
            }
            .navigationBarTitle("Edit Goal")
        }
    }
}

struct GoalEditorView_Previews: PreviewProvider {
    static var previews: some View {
        GoalEditorView(goal: .constant(Goal(goal_name: "basketball", goal_balance: 20.0, total_needed: 100.0)))
    }
}
