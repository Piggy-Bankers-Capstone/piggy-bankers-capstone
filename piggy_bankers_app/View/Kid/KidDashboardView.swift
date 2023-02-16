//
//  KidDashboardView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/16/23.
//

import SwiftUI

struct KidDashboardView: View {
    let kid = Kid(kid_name: "mitch", total_balance: 100.00, goals: [Goal(goal_name: "bball", goal_amount: 30.0), Goal(goal_name: "shoes", goal_amount: 50.0), Goal(goal_name: "smoker", goal_amount: 1200.00)])
    
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
                    Text("Goals")
                        .font(.title)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
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
