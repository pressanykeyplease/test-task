//
//  Model.swift
//  TestWork
//
//  Created by Елизавета Котлова on 11.02.2021.
//

import Foundation

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadInformation(completionHandler: @escaping ((Information?) -> Void)) {
    guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else {
        completionHandler(nil)
        return
    }
    let session = URLSession(configuration: .default)
    let downloadTask = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            completionHandler(nil)
            return
        }
        if let data = data, let typeInfo = try? JSONDecoder().decode(Information.self, from: data) {
            completionHandler(typeInfo)
        }
    }
    downloadTask.resume()
}
