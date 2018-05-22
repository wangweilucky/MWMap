//
//  HomeModel.swift
//  encoding_decoding
//
//  Created by 王大吉 on 12/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation

struct MWResult: Codable {
    var code: Int
    var message: String
    var data : MWUATResult
    
}

struct MWUATResult: Codable {
    var total_count: Int
    var total_pages: Int
    var list: [MWUATModel]
}

struct MWUATModel: Codable {
    var quantity: Int
    var unit: String
    var unitName: String = ""
    var appName: String
    var externalUserId: String
    var externalUserName: String
    var appKey: String
    var uatRemoteUrl: String
    var appUrl: String
    var isRequestActivated: Int
    var appIcon: String
}


//"quantity": 2,
//"unit": "HUAT",
//"unitName": "花溪钻",
//"appName": "花溪小说",
//"externalUserId": "aabbccdd",
//"externalUserName": "aabbccdd",
//"appKey": "fb61da1dc41f4e1f8d978a9e7547edda",
//"uatRemoteUrl": "http://aabbcc/uat/",
//"appUrl": "http://huaxi",
//"isRequestActivated": 1,
//"appIcon": "http://aa.png"


/// 当模型中定义键的类型和json中对应值的类型不符时，将会导致整个解析的失败。
//  在定义Model时，将可能为nil的属性一定要打上？,否则会导致整个解析失败。
//  例如在定义模型的时候将模型的appName属性由String类型错写成了Int类型，这样会导致解析失败，严重的会导致程序的奔溃。
//  let model = try! decoder.decode(MWResult.self, from: jsonData) 解析失败会导致程序的奔溃
