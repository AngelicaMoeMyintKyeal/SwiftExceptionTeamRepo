//
//  Idea.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 13/01/23.
//

import Foundation

struct Idea: Identifiable, Codable {
    var id = UUID()
    var body: String
    var parentWords: [String] = []
}


