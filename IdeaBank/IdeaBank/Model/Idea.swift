//
//  Idea.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 13/01/23.
//

import Foundation

struct Idea: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var inspirationWords: [Word]
    
    static var sampleIdeas = [
        Idea(name: "FirstIdea", description: "An idea that will make me millionare", inspirationWords: [Word.shortExampleWords[1], Word.shortExampleWords[2], Word.shortExampleWords[3]]),
        Idea(name: "FirstIdea", description: "An idea that will make me Billionare", inspirationWords: [Word.shortExampleWords[6], Word.shortExampleWords[9]]),
        Idea(name: "FirstIdea", description: "An idea that will make me Trillionare", inspirationWords: [Word.shortExampleWords[8]])
    ]
}
