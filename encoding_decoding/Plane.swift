//
//  Plane.swift
//  encoding_decoding
//
//  Created by 王大吉 on 17/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation


struct PlaneResult: Decodable, Encodable {
    var data: Plane
    var message: String
    var code: Int
    
    
    /// encoder和decoder的实现
    private enum CodingKeys: String, CodingKey {
        case data
        case code
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(Plane.self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.code, forKey: .code)
    }
}


struct Plane: Decodable , Encodable {
    var manufacturer: String
    var model: String
    var seats: Int
    
    
    /// encoder和decoder的实现
    private enum CodingKeys: String, CodingKey {
        case manufacturer
        case model
        case seats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.model = try container.decode(String.self, forKey: .model)
        self.seats = try container.decode(Int.self, forKey: .seats)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.manufacturer, forKey: .manufacturer)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.seats, forKey: .seats)
    }
    
    
}


