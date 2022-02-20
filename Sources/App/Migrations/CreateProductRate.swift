//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent

struct CreateProductRate: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("product_name_rate")
//            .id()
            .field("id", .int, .identifier(auto: true))
            .field("product_name", .string, .required)
            .field("product_rate", .double, .required)
            .field("rate_revised_date", .datetime, .required)
            .field("created_by", .string, .required)
            .field("created_on", .datetime, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("product_name_rate").delete()
    }
}
