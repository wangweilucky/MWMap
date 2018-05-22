//
//  Model2.swift
//  encoding_decoding
//
//  Created by 王大吉 on 21/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation

struct FlightPlan: Decodable {
    
    var aircraft :Aricraft
    
    var flightRules :FlightRules
    
    var route :[String]
    
    var departureTime: DepartureTime
    
    var remarks : String?
    
    
//    var proposedDepartureDate: Date? {
//        return departureTime["proposed"]
//    }
//
//    var actualDepartureDate : Date? {
//        return departureTime["actual"]
//    }
    
    /// 定义模型中的转换的键值
    private enum CodingKeys: String, CodingKey {
        case aircraft
        case route
        case flightRules = "flight_rules"
        case remarks
        case departureTime = "departure_time"
    }

}

extension FlightPlan {
    
}

struct Aricraft: Decodable {
    var identification: String
    var color: String
}

enum FlightRules: String, Decodable {
    case visual = "VFR"
    case instrument = "IFR"
}

struct DepartureTime: Decodable {
    var proposed : TimeInterval
    var actual : TimeInterval
}



/// 从字符串中解析枚举类型：json中一个属性对应的value是一组很小的值，使用枚举是最佳的选择

/// 处理键名和JSON属性名不一致的情况：一般的，后端会使用“蛇形命名法”，swift中将类型定义为：UpperCamelCase，其他的都定义为lowerCamelCase，在JOSNDecoder中keyDecodingStratrgy属性来切换不同写法语法上的不同。 或者一种更为可持续性的方法：使用Codingkeys来指定明确的映射关系，swift会寻找符合CodingKey协议的、名为CodingKeys的枚举类型，对于名称不匹配的键来指定明确的String原始值。

/// 时间戳解析成时间类型: 设置
//  let decoder = JSONDecoder()
//  decoder.dateDecodingStrategy = .secondsSince1970
//  decoder.dateDecodingStrategy = .iso8601



/// 可选值或者是指定默认值： 当对应键的值为null的时候，可以被Optional类型自动处理，但是不能处理缺少的键值

