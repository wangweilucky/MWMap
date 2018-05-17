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
    
}


struct Plane: Decodable , Encodable {
    var manufacturer: String
    var model: String
    var seats: Int
    
}


