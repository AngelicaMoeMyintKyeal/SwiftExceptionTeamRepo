//
//  WordCard.swift
//  IdeaBank
//
//  Created by シェイミ on 11/01/2023.
//

import SwiftUI

struct Word: Codable, Identifiable {
    var id = UUID().uuidString
    let word: String
    let definition: String
}

extension Word {
    // words that will be fetched by the WebService
    static let pool = ["Monkey", "Banana", "Chicken", "Contrary", "Cantankerous", "University", "Professor", "Message", "Shy", "Food", "Educator", "Fitness_Instructor", "Number", "Anxiety", "Cook", "Hairdresser", "Pressure", "Engineering", "Artist", "Manager", "Tax", "Healthcare", "Planner", "Birthday", "Scientist", "Receptionist", "Actor", "Books", "Photographer", "Mathematician", "Writer", "Cylinder", "Therapist", "Software_Dev", "Electrician", "Settle", "Lake", "Need", "Depression", "Mention", "Sunrise", "Monster", "Packet", "Rocket", "Sticky", "Tea", "Fresh", "Leftover", "Quote", "Get", "Modify", "Highlight", "Gather", "Lack", "Attract", "Push", "Attach", "Question", "Smile", "Reach", "Examine", "Hope", "Guarantee", "Fall", "Hope", "Fit", "Catch", "Heat", "Transmit", "Visit", "Worry", "Characterise", "Communicate", "Track", "Waste", "Clear", "Allow", "Start", "Mix", "Entertain", "Bound", "Deny", "Integrate", "Link", "Build", "Pin", "Rush", "Determine", "Dictate", "Discharge", "Furry", "Suitable", "Hard", "Nostalgic", "Amusing", "Sorry", "Women", "Bored", "Plucky", "Thoughtless", "Descriptive", "Even", "Adaptable", "Comfortable", "Breezy", "Sharp", "Puny", "Useless", "Spare", "Left", "Lovely", "Abrupt", "Habitual", "Panoramic", "Tasteful", "Harsh", "Realistic", "Standing", "Funny", "Unique", "Polite", "Tension", "Crazy", "Educated", "Quiet", "Sad"]
}

#if DEBUG
// MARK: special code for canvas preview
extension Word {
    static var preview: Word {
        Word(
            word: "Laziness",
            definition: "The art of taking rest before getting tired. Because prevention is better than cure"
        )
    }
}
#endif
