//
//  KidDashboardView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/16/23.
//

import SwiftUI

struct SubAccount: Hashable {
    let name: String
    let balance: Double
}


struct KidDashboardView: View {
    let kid = Kid(kid_name: "mitch", total_balance: 100.00, goals: [Goal(goal_name: "bball", goal_amount: 30.0), Goal(goal_name: "shoes", goal_amount: 50.0), Goal(goal_name: "smoker", goal_amount: 1200.00)])
    
    let accounts = [SubAccount(name: "savings", balance: 100.00), SubAccount(name: "college", balance: 250.00)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("Welcome, \(kid.kid_name)")
                        .font(.largeTitle)
                    
                    Divider()
                }
                .padding(.vertical, 20)
                
                Group {
                    Text("Total Balance:")
                        .font(.largeTitle)
                    Text("\(NumberFormatter.localizedString(from: kid.total_balance as NSNumber, number: .currency))")
                        .font(.title)
                        .foregroundColor(.green)
                    
                    Divider()
                }
                .padding(.vertical, 20)
                
                Group {
                    Text("Accounts")
                        .font(.title)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(accounts, id:\.self) { account in
                                AccountCardView(account: account)
                            }
                        }
                    }
                    
                    Divider()
                }
                .padding(.vertical, 20)
                
                Group {
                    Text("Goals")
                        .font(.title)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(kid.goals, id:\.self) { goal in
                                CardView(goal: goal)
                            }
                        }
                    }
                    
                    Divider()
                }
                .padding(.vertical, 20)
                
                Group {
                    Text("Show All Transactions")
                    
                    Divider()
                    
                    Text("Show All Transfers")
                }
                .padding(.vertical, 40)
            }
            .padding()
        }
    }
}

struct AccountCardView: View {
    let account: SubAccount
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.green
                
                VStack {
                    Text("\(account.name)")
                        .font(.title)
                    Text("\(NumberFormatter.localizedString(from: account.balance as NSNumber, number: .currency))")
                }
            }
        }
        .frame(width: 200, height: 250)
    }
}

struct CardView: View {
    let goal: Goal
    
    var body: some View {
        VStack {
            ZStack {
                Color.blue
                
                VStack {
                    Text("\(goal.goal_name)")
                        .font(.title)
                    Text("\(NumberFormatter.localizedString(from: goal.goal_amount as NSNumber, number: .currency))")
                }
            }
        }
        .frame(width: 200, height: 250)
    }
}

struct KidDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        KidDashboardView()
    }
}
