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
    let meanings: [Meaning]
    
    enum CodingKeys: String, CodingKey {
        case word = "word"
        case meanings = "meanings"
    }
}

struct Meaning: Codable {
    let definitions: [Definition]
}

struct Definition:  Codable {
    let definition: String
}

extension Word {
    static var exampleWords: [String] = [
        "Monkey",
        "Banana",
        "Chicken",
        "Contrary",
        "Cantankerous",
        "University",
        "Professor",
        "Message",
        "Shy",
        "Food",
        "Educator",
        "Fitness Instructor",
        "Number",
        "Anxiety",
        "Cook",
        "Hairdresser",
        "Pressure",
        "Engineering",
        "Artist",
        "Manager",
        "Tax",
        "Healthcare",
        "Planner",
        "Birthday",
        "Scientist",
        "Receptionist",
        "Actor",
        "Books",
        "Photographer",
        "Mathematician",
        "Writer",
        "Cylinder",
        "Therapist",
        "Software Dev",
        "Electrician",
        "Settle",
        "Lake",
        "Need",
        "Depression",
        "Mention",
        "Sunrise",
        "Monster",
        "Packet",
        "Rocket",
        "Sticky",
        "Tea",
        "Fresh",
        "Leftover",
        "Quote",
        "Get",
        "Modify",
        "Highlight",
        "Gather",
        "Lack",
        "Attract",
        "Push",
        "Attach",
        "Question",
        "Smile",
        "Reach",
        "Examine",
        "Hope",
        "Guarantee",
        "Fall",
        "Hope",
        "Fit",
        "Catch",
        "Heat",
        "Transmit",
        "Visit",
        "Worry",
        "Characterise",
        "Communicate",
        "Track",
        "Waste",
        "Clear",
        "Allow",
        "Start",
        "Mix",
        "Entertain",
        "Bound",
        "Deny",
        "Integrate",
        "Link",
        "Build",
        "Pin",
        "Rush",
        "Determine",
        "Dictate",
        "Discharge",
        "Furry",
        "Suitable",
        "Hard",
        "Nostalgic",
        "Amusing",
        "Sorry",
        "Women",
        "Bored",
        "Plucky",
        "Thoughtless",
        "Descriptive",
        "Even",
        "Adaptable",
        "Comfortable",
        "Breezy",
        "Sharp",
        "Puny",
        "Useless",
        "Spare",
        "Left",
        "Lovely",
        "Abrupt",
        "Habitual",
        "Panoramic",
        "Tasteful",
        "Harsh",
        "Realistic",
        "Standing",
        "Funny",
        "Unique",
        "Polite",
        "Tension",
        "Crazy",
        "Educated",
        "Quiet",
        "Sad"
    ]
}
