//
//  File.swift
//  
//
//  Created by raghad khalid alsaif on 27/08/1444 AH.
//

import Fluent
import Vapor

struct ProductController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let Product = routes.grouped("Product")
    }
}
