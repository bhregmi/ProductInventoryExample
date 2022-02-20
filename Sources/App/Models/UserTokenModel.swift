//
//  File.swift
//  
//
//  Created by Test User on 6/4/20.
//
/*
import Vapor
import Fluent

final class UserTokenModel: Model {
   
   static let schema = "tokens"
   
   struct FieldKeys {
       static var value: FieldKey { "value" }
       static var userId: FieldKey { "user_id" }
   }
   
   // MARK: - fields
   
   @ID() var id: UUID?
   @Field(key: FieldKeys.value) var value: String
   @Parent(key: FieldKeys.userId) var user: UserModel

   init() { }
   
   init(id: UserTokenModel.IDValue? = nil,
        value: String,
        userId: UserModel.IDValue)
   {
       self.id = id
       self.value = value
       self.$user.id = userId
   }
}

extension UserTokenModel: ModelAuthenticatable {
   static let valueKey = \UserTokenModel.$value
   static let userKey = \UserTokenModel.$user
   
   var isValid: Bool {
       true // you can check expiration or anything else...
   }
}

// a middleware that confroms to the BearerAuthenticator protocol
UserTokenModel.authenticator()
*/
