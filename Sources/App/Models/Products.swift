//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 27/08/1444 AH.
//

import Fluent
import Vapor
import FluentPostgresDriver


final class product: Model, Content{
    static let schema = "products"
    
    @ID (key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name : String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "price")
    var price: Double
    
    @Parent(key: "packaging_id")
    var packaging : Packaging
    
    init(){  }
    
    init(name : String, description : String, price : Double, packaging: Packaging){
        self.name = name
        self.description = description
        self.price = price
        self.$packaging.id = packaging.id!
    }
    
    
}
