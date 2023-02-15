//
//  ex.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/15/23.
//

import Foundation

/// Session
/// Credentials

// parent/user model
struct exUser {
    let id = UUID()
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let pin: String         // in-app auth against Kids
    var kids: [Kid]?        // optionally due to initially opening an account (parent). Alternatively we can "force" them to create at least one Kid on signup.
}

// kid model. Each Kid will have a primary account (checkings) upon Kid creation. A Kid can open new Accounts for savings, college funds, investing, emergency fund, etc. A Kid can create Goals as items they'd like to buy (bball, shoes, dolls, candy, etc). A Kid can transfer money between Accounts. A Kid can donate money from their checkings. Parents control auto donation contributions amount of each Transaction which will accrue over time until donated/paid off.
struct exKid: Identifiable {
    let id = UUID()
    let user_id: UUID       // parents' id
    let first_name: String  // to use later in visuals
    let last_name: String
    var username: String    // creativity for kids, can change whenenver
    var pin: String         // for in-app auth
    let primary_account: exPrimaryAccount ///** of type UUID [ PrimaryAccount.id ]
    var goals: [exGoal]?                  ///** of type UUID [ Goal.id ]
    var transfers: [exTransfer]?          ///** of type UUID [ Transfer.id ]
//    var last_donation_timestamp: Date?
//    var donations: [exDonation]?          ///** of type UUID [ Donation.id ]
}

// Kid.account will be primary account (like bank account with simple checkings/savings); within their primary account they can open accounts for investing to earn interest ('savings' and investing are same if both subject to interest from parents), college account, emergency fund/preparedness account. Big items! Separate of goals
struct exPrimaryAccount {
    let id = UUID()
    let user_id: UUID
    let kid_id: UUID
    let account_name: String
    let account_balance: Double
    let account_description: String
    let sub_accounts: [exSubAccount]?   ///**of type UUID e.g. [ SubAccount.id ]
}

// a SubAccount is opened in Kids Primary Account and are for saving, emergency, college, etc. Each subaccount belongs to a PrimaryAccount
struct exSubAccount {
    let id = UUID()
    let user_id: UUID
    let kid_id: UUID
    let primary_account_id: UUID
    let account_name: String
    let account_type: SubAccountType
    let account_balance: Double
    let account_description: String
    
    enum SubAccountType {
        case saving, investing, college_fund, emergency_fund, donation, other
    }
}

// Goals are items that a Kid wants to save for: basketball, bike, dolls, etc. A Kid's single 'savings' account will be for purchasing Goals.
struct exGoal: Identifiable {
    var id = UUID()
    var user_id: UUID
    var kid_id: UUID
    var goal_name: String
    var goal_amount: Double
    var goal_priority: GoalPriority?      // if something else is being purchased and a Goal with high priority is still in Goal list: Alert kid that they are giving up money towards that higher Goal... make sense? if its dumb throw it out
    
    enum GoalPriority {
        case high, medium, low
    }
}

// Transaction is the transfer of money from 1) User to Kid or 2) Kid to User ("purchasing" something). STRICTLY BETWEEN PRIMARYACCOUNT AND USER
struct exTransaction: Identifiable, Hashable {
    let id : UUID
    let user_id: UUID
    var kid_id: UUID
    var transaction_date: Date
    var transaction_type: String
    var transaction_amount: Double
    var transaction_memo: String
    var transaction_description: String
}

// Transfer is a Kid sending money between their Accounts whether Primary or Sub.
struct exTransfer {
    let id = UUID()
    let user_id: UUID
    let kid_id: UUID
    let transfer_amount: Double
    let transfer_memo: Double
    let transfer_timestamp: Date
    let to_account: UUID            // can be either Primary or Sub
    let from_account: UUID          // can be either Primary or Sub
}

// Donations are contributions made to charities. Each Kid will have a donations property holding all their donations. Kid.donations will accumulate automatically based on incoming Transactions (they will not be "charged" for their donation upon transaction), but then will pay the Kid.donations total from their primary account balance (checkings) from most recent donation (Kid.last_donation_timestamp)... upon paying off, Kid.donation zeros out and accumulates until next payoff/last_donation_timestamp is recorded. This makes it easy to create visuals for kids to see how much they've donated and how much they continue to be responsible for paying at a future date. Keeps Users up to date too on Kid donation info.
//struct exDonation {
//    let id = UUID()
//    let user_id: UUID
//    let kid_id: UUID
//    let donation_type: DonationType
//    let donation_amount: Double
//    let donation_timestamp: Date
//    let donation_memo: String
//
//    // different kinds of donations
//    enum DonationType {
//        case tithing
//        case charity
//        case other
//    }
//}
