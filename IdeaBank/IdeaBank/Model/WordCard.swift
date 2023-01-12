//
//  WordCard.swift
//  IdeaBank
//
//  Created by シェイミ on 11/01/2023.
//

import SwiftUI

// MARK: Sample Message Model
struct Word: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var word: String
    var description: String

    static var exampleWords = [
        Word(word: "Monkey", description: "A kind of simian"),
        Word(word: "Banana", description: "Fruit that a monkey likes to eat"),
        Word(word: "Chicken", description: "Everyone's favourite snack")
    ]
}
