//
//  HomeModel.swift
//  encoding_decoding
//
//  Created by 王大吉 on 12/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation

struct MWUATResult: Codable {
    var code: Int = 0
    var message: String = ""
    var total_count: Int = 0
    var total_pages: Int = 0
//    var list: [MWUATModel]?
}

struct MWUATModel: Codable {
    var appName: String = ""
    var appKey: String = ""
    var externalUserId: String = ""
    var quantity: Double = 0.0
    var uatRemoteUrl: String?
    var externalUserName: String = ""
    var shortUserName: String = ""
    var uatName: String = ""
    var appIcon: String = ""
}
