//
//  JSONModel.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 30/01/23.
//

import Foundation

// MARK: model for parsing the JSON fetched by the Dictionary API
struct WordResponse: Codable {
    var word: String
    var meanings: [Meanings]
}

struct Meanings: Codable {
    var definitions: [Definitions]
}

struct Definitions: Codable {
    var definition: String
}
