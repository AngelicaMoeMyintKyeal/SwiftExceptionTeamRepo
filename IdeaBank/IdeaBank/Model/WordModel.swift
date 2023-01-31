//
//  WordCard.swift
//  IdeaBank
//
//  Created by シェイミ on 11/01/2023.
//

import SwiftUI

// MARK: Sample Message Model
struct Word: Codable, Identifiable {
    var id = UUID().uuidString
    let word: String
    let meanings: [Meaning]?
    
    enum CodingKeys: String, CodingKey {
        case word = "word"
        case meanings = "meanings"
    }
}

struct Meaning: Codable {
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
}

extension Word {
    static var exampleWords: [Word] = [
        Word(word: "Monkey", meanings: nil),
        Word(word: "Banana", meanings: nil),
        Word(word: "Chicken", meanings: nil),
        Word(word: "Contrary", meanings: nil),
        Word(word: "Cantankerous", meanings: nil),
        Word(word: "University", meanings: nil),
        Word(word: "Professor", meanings: nil),
        Word(word: "Message", meanings: nil),
        Word(word: "Shy", meanings: nil),
        Word(word: "Food", meanings: nil),
        Word(word: "Educator", meanings: nil),
        Word(word: "Fitness Instructor", meanings: nil),
        Word(word: "Number", meanings: nil),
        Word(word: "Anxiety", meanings: nil),
        Word(word: "Cook", meanings: nil),
        Word(word: "Hairdresser", meanings: nil),
        Word(word: "Pressure", meanings: nil),
        Word(word: "Engineering", meanings: nil),
        Word(word: "Artist", meanings: nil),
        Word(word: "Manager", meanings: nil),
        Word(word: "Tax", meanings: nil),
        Word(word: "Healthcare", meanings: nil),
        Word(word: "Planner", meanings: nil),
        Word(word: "Birthday", meanings: nil),
        Word(word: "Scientist", meanings: nil),
        Word(word: "Receptionist", meanings: nil),
        Word(word: "Actor", meanings: nil),
        Word(word: "Books", meanings: nil),
        Word(word: "Photographer", meanings: nil),
        Word(word: "Mathematician", meanings: nil),
        Word(word: "Writer", meanings: nil),
        Word(word: "Cylinder", meanings: nil),
        Word(word: "Therapist", meanings: nil),
        Word(word: "Software Dev", meanings: nil),
        Word(word: "Electrician", meanings: nil),
        Word(word: "Settle", meanings: nil),
        Word(word: "Lake", meanings: nil),
        Word(word: "Need", meanings: nil),
        Word(word: "Depression", meanings: nil),
        Word(word: "Mention", meanings: nil),
        Word(word: "Sunrise", meanings: nil),
        Word(word: "Monster", meanings: nil),
        Word(word: "Packet", meanings: nil),
        Word(word: "Rocket", meanings: nil),
        Word(word: "Sticky", meanings: nil),
        Word(word: "Tea", meanings: nil),
        Word(word: "Fresh", meanings: nil),
        Word(word: "Leftover", meanings: nil),
        Word(word: "Quote", meanings: nil),
        Word(word: "Get", meanings: nil),
        Word(word: "Modify", meanings: nil),
        Word(word: "Highlight", meanings: nil),
        Word(word: "Gather", meanings: nil),
        Word(word: "Lack", meanings: nil),
        Word(word: "Attract", meanings: nil),
        Word(word: "Push", meanings: nil),
        Word(word: "Attach", meanings: nil),
        Word(word: "Question", meanings: nil),
        Word(word: "Smile", meanings: nil),
        Word(word: "Reach", meanings: nil),
        Word(word: "Examine", meanings: nil),
        Word(word: "Hope", meanings: nil),
        Word(word: "Guarantee", meanings: nil),
        Word(word: "Fall", meanings: nil),
        Word(word: "Hope", meanings: nil),
        Word(word: "Fit", meanings: nil),
        Word(word: "Catch", meanings: nil),
        Word(word: "Heat", meanings: nil),
        Word(word: "Transmit", meanings: nil),
        Word(word: "Visit", meanings: nil),
        Word(word: "Worry", meanings: nil),
        Word(word: "Characterise", meanings: nil),
        Word(word: "Communicate", meanings: nil),
        Word(word: "Track", meanings: nil),
        Word(word: "Waste", meanings: nil),
        Word(word: "Clear", meanings: nil),
        Word(word: "Allow", meanings: nil),
        Word(word: "Start", meanings: nil),
        Word(word: "Mix", meanings: nil),
        Word(word: "Entertain", meanings: nil),
        Word(word: "Bound", meanings: nil),
        Word(word: "Deny", meanings: nil),
        Word(word: "Integrate", meanings: nil),
        Word(word: "Link", meanings: nil),
        Word(word: "Build", meanings: nil),
        Word(word: "Pin", meanings: nil),
        Word(word: "Rush", meanings: nil),
        Word(word: "Determine", meanings: nil),
        Word(word: "Dictate", meanings: nil),
        Word(word: "Discharge", meanings: nil),
        Word(word: "Furry", meanings: nil),
        Word(word: "Suitable", meanings: nil),
        Word(word: "Hard", meanings: nil),
        Word(word: "Nostalgic", meanings: nil),
        Word(word: "Amusing", meanings: nil),
        Word(word: "Sorry", meanings: nil),
        Word(word: "Women", meanings: nil),
        Word(word: "Bored", meanings: nil),
        Word(word: "Plucky", meanings: nil),
        Word(word: "Thoughtless", meanings: nil),
        Word(word: "Descriptive", meanings: nil),
        Word(word: "Even", meanings: nil),
        Word(word: "Adaptable", meanings: nil),
        Word(word: "Comfortable", meanings: nil),
        Word(word: "Breezy", meanings: nil),
        Word(word: "Sharp", meanings: nil),
        Word(word: "Puny", meanings: nil),
        Word(word: "Useless", meanings: nil),
        Word(word: "Spare", meanings: nil),
        Word(word: "Left", meanings: nil),
        Word(word: "Lovely", meanings: nil),
        Word(word: "Abrupt", meanings: nil),
        Word(word: "Habitual", meanings: nil),
        Word(word: "Panoramic", meanings: nil),
        Word(word: "Tasteful", meanings: nil),
        Word(word: "Harsh", meanings: nil),
        Word(word: "Realistic", meanings: nil),
        Word(word: "Standing", meanings: nil),
        Word(word: "Funny", meanings: nil),
        Word(word: "Unique", meanings: nil),
        Word(word: "Polite", meanings: nil),
        Word(word: "Tension", meanings: nil),
        Word(word: "Crazy", meanings: nil),
        Word(word: "Educated", meanings: nil),
        Word(word: "Quiet", meanings: nil),
        Word(word: "Sad", meanings: nil)
    ]
}
