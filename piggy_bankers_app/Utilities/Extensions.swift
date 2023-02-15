//
//  Extensions.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/15/23.
//

import Foundation

extension String {
    func shortDate() -> Date {
        let isoDate = self
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: isoDate) {
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            
            let finalDate: Date = calendar.date(from: components) ?? Date()
            
            return finalDate
        } else {
            fatalError("issue converting app.transaction.date: String to Date")
        }
    }
}
