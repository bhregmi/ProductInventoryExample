//
//  File.swift
//  
//
//  Created by Test User on 6/4/20.
//
/*
import Vapor
import Fluent

final class UserModel: Model {
        
    static let schema = "users"

    struct FieldKeys {
        static var email: FieldKey { "email" }
        static var password: FieldKey { "password" }
    }
    
    // MARK: - fields
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.email) var email: String
    @Field(key: FieldKeys.password) var password: String
    
    init() { }
    
    init(id: UserModel.IDValue? = nil,
         email: String,
         password: String)
    {
        self.id = id
        self.email = email
        self.password = password
    }
}

extension UserModel: Authenticatable {}

struct UserModelFragmentAuthenticator: RequestAuthenticator {
    typealias User = UserModel

    func authenticate(request: Request) -> EventLoopFuture<Void> {
        User.find(UUID(uuidString: request.url.fragment ?? ""), on: request.db)
        .map {
            if let user = $0 {
                request.auth.login(user)
            }
        }
    }
}
*/

