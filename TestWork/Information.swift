//
//  TypeInfo.swift
//  TestWork
//
//  Created by Елизавета Котлова on 11.02.2021.
//

import Foundation

// MARK: - TypeInfo
struct Information: Codable {
    let data: [DataElement]
    let view: [String]
}

// MARK: - Datum
struct DataElement: Codable {
    let name: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let text: String
}
