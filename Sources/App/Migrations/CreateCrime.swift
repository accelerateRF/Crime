//
//  File.swift
//  
//
//  Created by Randy Fong on 11/04/23.
//

import Fluent

struct CreateCrime: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema("crime")
      .id()
      .field("caseId", .string, .required)
      .field("dateOfCrime", .datetime, .required)
      .field("user", .string, .required)
      .field("name", .string, .required)
      .field("phone", .string, .required)
      .field("latitude", .string, .required)
      .field("longitude", .string, .required)
      .field("mediaUrl", .string, .required)
      .field("message", .string, .required)
      .create()
  }
  
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema("crime").delete()
  }
}


