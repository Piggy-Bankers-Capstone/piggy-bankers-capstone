import SwiftUI

struct KidDetailsView: View {
    @EnvironmentObject var userManager: UserManager
    
    @State var kid: Kid
    @State private var newGoalName = ""
    @State private var newGoalAmount = ""
    @State private var newGoalTotalNeeded = ""
    @State private var showDuplicateError = false
    @State private var showGoalEditor = false
    @State private var showAddGoalView = false
    @State private var newSubBalanceName = ""
    @State private var newSubBalanceAmount = ""
    @State private var showAddSubBalanceView = false
    
    var body: some View {
        VStack {
            Group {
                Text("Welcome, \(kid.kid_name)")
                    .font(.largeTitle)
                Text("$\(kid.total_balance, specifier: "%.2f")").font(.largeTitle)
                
                Divider()
            }
            .padding(.vertical, 20)
            Group{
                HStack {
                    Text("Goals").font(.title)
                    Spacer()
                    Button(action: {
                        self.showAddGoalView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddGoalView) {
                        AddGoalView(kid: self.$kid)
                    }
                }
                
                List {
                    ForEach(kid.goals) { goal in
                        HStack {
                            Text("\(goal.goal_name): $\(goal.goal_balance, specifier: "%.2f")/$\(goal.total_needed, specifier: "%.2f")")
                            Button(action: {
                                self.newGoalName = goal.goal_name
                                self.newGoalAmount = String(goal.goal_balance)
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
                
                HStack {
                    Text("SubBalances").font(.title)
                    Spacer()
                    Button(action: {
                        self.showAddSubBalanceView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddSubBalanceView) {
                        AddSubBalanceView(kid: self.$kid)
                    }
                }
                
                List {
                    ForEach(kid.sub_balances) { subBalance in
                        HStack {
                            Text("\(subBalance.name): $\(subBalance.balance, specifier: "%.2f")")
                        }
                    }
                };
            }
        }
    }
}


struct KidDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        KidDetailsView(kid: Kid(kid_name: "elijah", total_balance: 999.9, sub_balances: [SubBalance(kid_id: 1, name: "Savings", balance: 50.0)], goals: [Goal(goal_name: "Basketball", goal_balance: 10.0, total_needed: 100.0)]))
            .environmentObject(UserManager())
    }
}

