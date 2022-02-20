import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    try app.register(collection: TodoController())
    
        //MARK: For Customer
        let customerController = CustomerController()
        app.get("customer", use: customerController.index)
    //    app.get("customer", ":customerID", use: customerController.index)
        app.post("customer", use: customerController.create)
        app.delete("customer", ":customerID", use: customerController.delete)
        
        //MARK: For Customer PAN
        let customerPanController = CustomerPanController()
            app.get("customerpan", use: customerPanController.index)
        //    app.get("customer", ":customerID", use: customerController.index)
    //        app.post("customer", use: customerController.create)
    //        app.delete("customer", ":customerID", use: customerController.delete)
        
        //MARK: For Users
    //    let userController = UserController()
    //    app.get("me", use: userController.getMyOwnUser)
    //    app.post("signup", use: userController.create)
    //    app.post("login", use: userController.login)
        try app.register(collection: UserController())
        
        // New users
    //    app.grouped(UserModelFragmentAuthenticator(),UserModel.guardMiddleware())
    //    .get("sign-in") { req in
    //        "I'm authenticated"
    //    }
        
        let productNameRateController = ProductNameRateController()
        app.get("productnamerate", use: productNameRateController.index)
        app.post("productnamerate", use: productNameRateController.create)
        app.delete("productnamerate", ":productnamerateID", use: productNameRateController.delete)

        let productinventoryController = ProductInventoryController()
        app.get("productinventory", use: productinventoryController.index)
        app.post("productinventory", use: productinventoryController.create)
        app.delete("productinventory", ":productInventoryID", use: productinventoryController.delete)
    
    
}
