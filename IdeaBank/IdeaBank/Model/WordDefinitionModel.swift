//
//  WordDefintionModel.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 16/01/23.
//

import Foundation

struct Words: Decodable {
    var meanings: [Meaning]
}

struct Meaning: Decodable {
    var definitions: [Definition]
}

struct Definition: Decodable {
    var definition: String
}
