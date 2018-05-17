//
//  Model.swift
//  encoding_decoding
//
//  Created by 王大吉 on 8/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation

class LanguageClass: Codable {
    var name    : String
    var version : String
    var author : Author?
    
    // LanguageClass初始化1
    init(name: String, version: String) {
        self.name    = name
        self.version = version
    }
}

extension LanguageClass {
    // LanguageClass初始化2
    convenience init(name: String) {
        self.init(name: name, version: "last")
    }
}

struct LanguageStruct: Codable {
    var name    : String
    var version : String
    
    /// LanguageStruct初始化
    init(name: String, version: String) {
        self.name    = name
        self.version = version
    }
    
    init(name: String) {
        self.init(name: name, version: "last")
    }
}

struct Author: Codable {
    var people :People
    var fans :[People]
}


struct People: Codable {
    var name : String
    var age : String
}
