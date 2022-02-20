//
//  File.swift
//  
//
//  Created by Test User on 5/20/20.
//

import Fluent
import Vapor

// MARK: - PanModel
final class PanModel: Model, Content {
static let schema = "pan_info"

        
        @ID(custom: "id")
        var id: Int?
        

        @Field(key: "customer_PAN")
        var customerPAN: String
        
        @Field(key: "business_name")
        var businessName: String
        
        @Field(key: "customer_name")
        var customerName: String
        
        @Field(key: "customer_address")
        var customerAddress: String
        
        @Field(key: "customer_phone")
        var customerPhone: String
        
        @Field(key: "created_by")
        var createdBy: String
        
        @Timestamp(key: "created_on", on: .create)
        var createdOn: Date?
        
        @Field(key: "is_active")
        var isActive: Bool
        

        init() { }

        init(id: Int? = nil, customerPAN: String, businessName: String, customerName: String, customerAddress: String, customerPhone: String, createdBy: String, createdOn: Date, isActive: Bool) {
            self.id = id
            self.customerPAN = customerPAN
            self.businessName = businessName
            self.customerName = customerName
            self.customerAddress = customerAddress
            self.customerPhone = customerPhone
            self.createdBy = createdBy
            self.createdOn = createdOn
            self.isActive = isActive
        }
    }




