//
//  Crime.swift
//  
//
//  Created by Randy Fong on 11/04/23.
//

import Foundation

import Vapor
import Fluent

final class Crime: Model {
  static let schema = "crime"
  
    @ID
    var id: UUID?
    
    @Field(key: "caseId")
    var caseId: String
    
    @Field(key: "dateOfCrime")
    var dateOfCrime: Date

    @Field(key: "user")
    var user: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "phone")
    var phone: String
    
    @Field(key: "latitude")
    var latitude: String
    
    @Field(key: "longitude")
    var longitude: String
    
    @Field(key: "mediaUrl")
    var mediaUrl: String
    
    @Field(key: "message")
    var message: String

  
  init() {}
  
  // 6
  init(id: UUID? = nil,
       caseId: String,
       dateOfCrime: Date,
       user: String,
       name: String,
       phone: String,
       latitude: String,
       longitude: String,
       mediaUrl: String,
       message: String) {
      self.id           = id
      self.caseId       = caseId
      self.dateOfCrime  = dateOfCrime
      self.user         = user
      self.name         = name
      self.phone        = phone
      self.latitude     = latitude
      self.longitude    = longitude
      self.mediaUrl = mediaUrl
      self.message = message

  }
}

extension Crime: Content {}
