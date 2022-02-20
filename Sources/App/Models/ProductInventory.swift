//
//  File.swift
//  
//
//  Created by Test User on 4/22/20.
//

import Fluent
import Vapor

final class ProductInventory: Model, Content {
    static let schema = "product_inventory"
    
    @ID(custom: "id")
    var id: Int?
        
    @Field(key: "product_quantity")
    var productQuantity: Double
    
    @Field(key: "unloaded_date")
    var unloadedDate: Date?
    
    @Field(key: "unloaded_by")
    var unloadedBy: String
    
    @Field(key: "is_billable")
    var isBillable: Bool
    
    @Timestamp(key: "created_on", on: .create)
    var createdOn: Date?
    
    // Reference to the Customer this record belongs to .
     @Parent(key: "customer_id")
     var customer: Customer
    
    // Reference to the Gas Rate this record belongs to .
    @Parent(key: "product_name_rate_id")
    var productNameRate: ProductNameRate


    init() { }

    init(id: Int? = nil, productQuantity: Double, unloadedDate: Date, unloadedBy: String, isBillable: Bool, createdOn: Date, customerID: Int,productNameRateID: Int) {
        self.id = id
        self.productQuantity = productQuantity
        self.unloadedDate = unloadedDate
        self.unloadedBy = unloadedBy
        self.isBillable = isBillable
        self.createdOn = createdOn
        self.$customer.id = customerID
        self.$productNameRate.id = productNameRateID
    }
}
