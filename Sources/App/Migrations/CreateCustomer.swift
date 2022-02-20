//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent

struct CreateCustomer: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("customers")
//            .id()
            .field("id", .int, .identifier(auto: true))
            .field("customer_PAN", .string, .required)
            .field("business_name", .string, .required)
            .field("customer_name", .string, .required)
            .field("customer_address", .string, .required)
            .field("customer_phone", .string, .required)
            .field("created_by", .string, .required)
            .field("created_on", .datetime, .required)
            .field("is_active", .bool, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("customers").delete()
    }
}



