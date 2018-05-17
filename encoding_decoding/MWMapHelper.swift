//
//  MWMapHelper.swift
//  encoding_decoding
//
//  Created by 王大吉 on 12/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import Foundation

public class MWMapEncoder {
    
    /// no throws
    
    /// convert model to  jsonString or optional
    public func encoderToString<T>(value: T) -> String? where T : Encodable {
        
        /// convert error to optional
        guard let data = try? MWEncoder().encode(value: value.self)
            , let jsonString = String(bytes: data, encoding: .utf8)  else { return nil }
        return jsonString
    }
    
    /// convert model to  Dictionary or optional
    public func encoderToDictionary<T>(value: T) -> Dictionary<String, Any>? where T : Encodable {
        
        /// convert error to optional
        guard let data = try? MWEncoder().encode(value: value.self)
            , let dictionary = try? JSONSerialization.jsonObject(with: data, options: [])
            , let dic = dictionary as? Dictionary<String, Any> else { return nil }
        return dic
    }
}

public class MWMapDecoder<T : Decodable> {
    
    /// no throws
    public typealias MWMAPTYPE = T
    
    /// convert jsonString to  model or optional
    public func decoderString(value: String) -> MWMAPTYPE? {
        
        /// convert error to optional
        guard let data = value.data(using: .utf8)
            , let model = try? MWDecoder().decode(data) as MWMAPTYPE
            else { return nil }
        return model
    }
    
    /// convert model to  Dictionary or optional
    public func decoderDictionary(value: Dictionary<String, Any>) -> MWMAPTYPE? {
        
        /// convert error to optional
        guard let data = try? JSONSerialization.data(withJSONObject: value, options: [])
            , let model = try? MWDecoder().decode(data) as MWMAPTYPE
            else { return nil }
        return model
    }
    
    /// convert jsonString to  model or optional
    public func decoder(value: Data) -> MWMAPTYPE? {
        
        /// convert error to optional
        guard let model = try? MWDecoder().decode(value) as MWMAPTYPE
            else { return nil }
        return model
    }
}
