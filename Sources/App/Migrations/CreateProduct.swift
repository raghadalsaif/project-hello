//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 28/08/1444 AH.
//

import Foundation


import Fluent
import Vapor

struct CreateProduct : AsyncMigration  {
    func prepare(on database: Database) async throws {
        
        try await database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("price", .double, .required)
            .field("packaging_id", .uuid, .required, .references("packaging", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("products").delete()
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let Product = try await Product.find(req.parameters.get("ProductID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await Product.delete(on: req.db)
        return .noContent
    }
    
}
