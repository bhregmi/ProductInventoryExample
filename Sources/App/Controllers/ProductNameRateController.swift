//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent
import Vapor


struct ProductNameRateController {
    func index(req: Request) throws -> EventLoopFuture<[ProductNameRate]> {
        return ProductNameRate.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<ProductNameRate> {
        let productNameRate = try req.content.decode(ProductNameRate.self)
        return productNameRate.save(on: req.db).map { productNameRate}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return ProductNameRate.find(req.parameters.get("productnamerateID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
