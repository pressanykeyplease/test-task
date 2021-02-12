//
//  Model.swift
//  TestWork
//
//  Created by Елизавета Котлова on 11.02.2021.
//

import Foundation

var information: [Information] = []

var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadInformation(completionHandler: (()->Void)?) {
    
    let url = URL(string: "https://pryaniky.com/static/json/sample.json")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) {(urlFile, responce, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseInformation()
            completionHandler?()
        }
    }
    
    downloadTask.resume()

}

func parseInformation() {
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }

    if let array = rootDictionary! ["name"] as? [Dictionary<String, Any>] {
        var returnArray: [Information] = []
        
        for dict in array {
            let newInformation = Information(dictionary: dict)
            returnArray.append(newInformation)
        }
        
        information = returnArray
    }
    
   
}
