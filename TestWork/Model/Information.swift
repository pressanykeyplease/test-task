//
//  Information.swift
//  TestWork
//
//  Created by Елизавета Котлова on 11.02.2021.
//

import Foundation

/*
 https://pryaniky.com/static/json/sample.json
 */

struct Information {
    var name: String
    var data: String
    var picture: String
    var selector: String
    var url: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>) {
        name = dictionary["name"] as? String ?? ""
        data = dictionary["data"] as? String ?? ""
        picture = dictionary["picture"] as? String ?? ""
        selector = dictionary["selector"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""]) ["name"] as? String ?? ""
    }
}

