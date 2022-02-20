//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent

struct CreateProductInventory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("product_inventory")
//            .id()
            .field("id", .int, .identifier(auto: true))
            .field("product_quantity", .double, .required)
            .field("unloaded_date", .datetime, .required)
            .field("unloaded_by", .string, .required)
            .field("is_billable", .bool, .required)
            .field("created_on", .datetime, .required)
            .field("customer_id", .int, .references("customers", "id"))
            .field("product_name_rate_id", .int, .references("product_name_rate", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("product_inventory").delete()
    }
}

//static func prepare(on conn: PostgreSQLConnection) -> Future<Void> {
//    return Database.update(User.self, on: conn) { builder in
//        builder.field(for: \User.firstName, type: .text, .default(.literal("")))
//    }
//}

