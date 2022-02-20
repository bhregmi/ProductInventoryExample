//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent
import Vapor


struct ProductInventoryController {
    func index(req: Request) throws -> EventLoopFuture<[ProductInventory]> {
        return ProductInventory.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<ProductInventory> {
        let productInventory = try req.content.decode(ProductInventory.self)
        return productInventory.save(on: req.db).map { productInventory}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return ProductInventory.find(req.parameters.get("productInventoryID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

