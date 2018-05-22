//
//  ViewController.swift
//  encoding_decoding
//
//  Created by 王大吉 on 8/5/2018.
//  Copyright © 2018 王大吉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // model -> jsonString/Dictionary -> model
//        demo1()
//        demo2()
//        demo3()
//        demo4()
    }
    
}

extension ViewController {
    func demo1() {
        
//        let swift4 = LanguageClass(name: "swift", version: "4.0")
        let swift4 = LanguageStruct(name: "swift", version: "4.0")
        
        /// convert model to jsonString
        guard let jsonString = MWMapEncoder().encoderToString(value: swift4) else { return }
        print(jsonString)
        
        /// convert model to [String: any]
        guard let dictionary = MWMapEncoder().encoderToDictionary(value: swift4) else { return }
        print(dictionary)
        
        /// convert jsonString to model
        guard let model = MWMapDecoder<LanguageClass>().decoderString(value: jsonString)
            else { return }
        print(model)
        
        /// convert dictionary to model
        guard let model1 = MWMapDecoder<LanguageClass>().decoderDictionary(value: dictionary) else { return }
        print(model1)
    }
    
    func demo2() {
        guard let path = Bundle.main.path(forResource: "homejson", ofType: "json")
            , let jsonData = NSData(contentsOfFile: path) as Data?
//            , let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
//            , let json1 = try? JSONSerialization.data(withJSONObject: jsonString, options: [.prettyPrinted])
//            , let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false) // jsonString contant "\" "\n"
//            , let json = try? JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments])
//            , let homeModel = MWMapDecoder<MWUATResult>().decoderDictionary(value: json as! [String :Any])
            
            else { return }
        
        
        let decoder = JSONDecoder()
        let model = try! decoder.decode(MWResult.self, from: jsonData)
        print(model)
    }
    
    
    func demo3() {
        let json = """
{
"code" : 1,
"message" :"",
"planes" : [
    {
    "manufacturer": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4
    },
    {
    "manufacturer": "Piper",
    "model": "PA-28 Cherokee",
    "seats": 4
    }]
}
""".data(using: .utf8)
        
        let decoder = JSONDecoder()
        let plane = try! decoder.decode(PlaneResult.self, from: json!)
//        let plane = try! decoder.decode([String: [Plane]].self, from: json!) // 需要将json中的code和message字段干掉
        print(plane)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted// 在print的时候会自动加上换行符号，显示上比较优雅
        let jsonData = try? encoder.encode(plane)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString!)
        
        
    }
    
    func demo4() {
        let jsonData =
        """
{
            "aircraft": {
                "identification": "NA12345",
                "color": "Blue/White"
            },
            "flight_rules": "IFR",
            "route": ["KTTD", "KHIO"],
            "departure_time": {
                "proposed": 1526902510,
                "actual": 1526912510
            },
            "remarks": null
        }
""".data(using: .utf8)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let model = try! decoder.decode(FlightPlan.self, from: jsonData!)
        print(model.departureTime.actual)
        
    }
}
