//
//  MWMap.swift
//  encoding_decoding
//
//  Created by 王大吉 on 12/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation


enum MWEncoderError<Y>: Error {
    case encode(Y)
}

enum MWDeoderError<Y>: Error {
    case decode(Y)
}

public final class MWEncoder {
    
    /**
     convert model to Data
     
     - parameter model: model
     - returns : jsonString
     */
    public func encode<T>(value: T) throws -> Data where T : Encodable {
        
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(value)
            return encoded
        } catch {
            throw MWEncoderError.encode(value)
        }
    }
}

public final class MWDecoder {
    
    /**
     convert Data to model
     
     - parameter Data: Data
     - returns : model
     */
    public func decode<T>(_ value: Data) throws -> T where T: Decodable {
        
        let decoder = JSONDecoder()
        do {
            let decodered = try decoder.decode(T.self, from: value)
            return decodered
        } catch {
            throw MWDeoderError.decode(value)
        }
    }
}
