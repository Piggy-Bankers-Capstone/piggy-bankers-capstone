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
                
                TextField("\(goal.goal_amount.description)", text: $newGoalAmount)
                
                Button(action: {
                    guard let goalAmount = Double(newGoalAmount) else { return }
                    guard let goalTotalNeeded = Double(newGoalTotalNeeded), goalTotalNeeded >= goalAmount else { return }
                    self.goal = Goal(goal_name: self.newGoalName, goal_amount: goalAmount)
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
        GoalEditorView(goal: .constant(Goal(goal_name: "basketball", goal_amount: 20.0)))
    }
}
