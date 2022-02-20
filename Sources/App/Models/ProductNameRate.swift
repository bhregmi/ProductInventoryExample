//
//  File.swift
//  
//
//  Created by Test User on 4/27/20.
//

import Fluent
import Vapor

final class ProductNameRate: Model, Content {
    static let schema = "product_name_rate"
    
    @ID(custom: "id")
    var id: Int?
    

    @Field(key: "product_name")
    var productName: String
    
    @Field(key: "product_rate")
    var productRate: Double
    
   
    @Field(key: "rate_revised_date")
    var rateRevisedDate: Date?
    
    
    @Field(key: "created_by")
    var createdBy: String
    
    @Timestamp(key: "created_on", on: .create)
    var createdOn: Date?

    @Children(for: \.$productNameRate)
    var productInventory: [ProductInventory]

    init() { }

    init(id: Int? = nil, productName: String, productRate: Double, rateRevisedDate: Date, createdBy: String, createdOn: Date) {
        self.id = id
        self.productName = productName
        self.productRate = productRate
        self.rateRevisedDate = rateRevisedDate
        self.createdBy = createdBy
        self.createdOn = createdOn
    }
}

