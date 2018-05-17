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
        demo1()
        
        
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
            , let jsonString = try? String(contentsOfFile: path)
            , let jsonData = jsonString.data(using: .utf8)
            , let jsonDic = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            , let jsonDictionay = jsonDic as? [String : Any] else { return }
        
        let homeModel = MWMapDecoder<MWUATResult>().decoderDictionary(value: jsonDictionay)
        print(homeModel)
    }
}
