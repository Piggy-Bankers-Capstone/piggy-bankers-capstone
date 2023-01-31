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
    @State private var newKidName = ""
    @State private var newKidBalance = ""
}

struct KidDetailsView: View {
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
                        Text("\(goal.goal_name): $\(goal.goal_amount, specifier: "%.2f")/$\(goal.total_needed, specifier: "%.2f")")
                        Button(action: {
                            self.newGoalName = goal.goal_name
                            self.newGoalAmount = String(goal.goal_amount)
                            self.newGoalTotalNeeded = String(goal.total_needed)
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
                    self.kid.goals.append(Goal(goal_name: self.newGoalName, goal_amount: goalAmount, total_needed: goalTotalNeeded))
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
                TextField("\(goal.total_needed.description)", text: $newGoalTotalNeeded)
                Button(action: {
                    guard let goalAmount = Double(newGoalAmount), goalAmount <= self.goal.total_needed else { return }
                    guard let goalTotalNeeded = Double(newGoalTotalNeeded), goalTotalNeeded >= goalAmount else { return }
                    self.goal = Goal(goal_name: self.newGoalName, goal_amount: goalAmount, total_needed: goalTotalNeeded)
                    self.showGoalEditor = false
                }) {
                    Text("Save")
                }
            }
            .navigationBarTitle("Edit Goal")
        }
    }
}


struct Kid: Identifiable {
    let id = UUID()
    let kid_name: String
    let total_balance: Double
    var goals: [Goal] = []
}

struct Goal: Identifiable {
    var id = UUID()
    var goal_name: String
    var goal_amount: Double
    var total_needed: Double

    init(goal_name: String, goal_amount: Double, total_needed: Double) {
        self.goal_name = goal_name
        self.goal_amount = goal_amount
        self.total_needed = total_needed
    }
}



struct KidView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
