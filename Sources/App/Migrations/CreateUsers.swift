//
//  File.swift
//  
//
//  Created by Test User on 6/1/20.
//

import Fluent

// 1
struct CreateUsers: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    // 2
    database.schema("user")
       // 3
      .field("id", .uuid, .identifier(auto: true))
      .field("username", .string, .required)
      .unique(on: "username")
      .field("password_hash", .string, .required)
      .field("created_at", .datetime, .required)
      .field("updated_at", .datetime, .required)
      // 4
      .create()
  }

  // 5
  func revert(on database: Database) -> EventLoopFuture<Void> {
//    database.schema(Token.schema).delete()
    database.schema("user").delete()
  }
}
