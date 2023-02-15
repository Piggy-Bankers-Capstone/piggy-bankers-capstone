//
//  PGConfig.swift
//  piggy_bankers_app
//
//  Created by Jonah Duffin on 2/15/23.
//

import Foundation
import PostgresClientKit

struct PGConfig {
    static var configuration = {
        var tempconfig = PostgresClientKit.ConnectionConfiguration()
        tempconfig.host = "piggybankers.cm676jibchhn.us-west-1.rds.amazonaws.com"
        tempconfig.database = "piggy"
        tempconfig.user = "postgres"
        tempconfig.credential = .scramSHA256(password: "piggybankers")
        return tempconfig
    }
}
