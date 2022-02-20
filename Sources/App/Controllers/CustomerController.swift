//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent
import Vapor

struct CustomerController {
    func index(req: Request) throws -> EventLoopFuture<[Customer]> {
        return Customer.query(on: req.db).all()
    }
    

    func create(req: Request) throws -> EventLoopFuture<Customer> {
        let customer = try req.content.decode(Customer.self)
        return customer.save(on: req.db).map { customer }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Customer.find(req.parameters.get("customerID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
