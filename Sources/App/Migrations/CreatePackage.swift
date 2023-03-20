//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 28/08/1444 AH.
//

import Foundation

import Fluent
import Vapor

struct CreatePackage : AsyncMigration  {
    func prepare(on database: Database) async throws {
        try await database.schema("packaging")
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("sustainabilityRating", .double, .required)
            .create()
            
    }

    func revert(on database: Database) async throws {
        try await database.schema("packaging").delete()
    }
    
   
   
}

