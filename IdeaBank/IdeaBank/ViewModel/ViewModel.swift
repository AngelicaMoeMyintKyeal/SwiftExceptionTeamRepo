//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    // FetchedWords is all words, displayingEords is a subset that will be updated based on user interaction to reduce memory usage
    
    @Published var fetchedWords: [Word] = []
    @Published var displayingWords: [Word]?
    
    init() {
        fetchedWords = [
            Word(word: "Monkey", description: "A kind of simian"),
            Word(word: "Banana", description: "Fruit that a monkey likes to eat"),
            Word(word: "Chicken", description: "Everyone's favourite snack"),
            Word(word: "ExtremlyLongWord", description: "A really long word that is used for testing UI"),
            Word(word: "AnotherVeryLongWord", description: "You get the idea"),
            Word(word: "Contrary", description: "Mary, Mary...."),
            Word(word: "Cantankerous", description: "A description of myself in the morning"),
            Word(word: "University", description: ""),
            Word(word: "Professor", description: ""),
            Word(word: "Message", description: ""),
            Word(word: "Shy", description: ""),
            Word(word: "Food", description: ""),
            Word(word: "Educator", description: ""),
            Word(word: "Fitness Instructor", description: ""),
            Word(word: "Number", description: ""),
            Word(word: "Anxiety", description: ""),
            Word(word: "Cook", description: ""),
            Word(word: "Hairdresser", description: ""),
            Word(word: "Pressure", description: ""),
            Word(word: "Engineering", description: ""),
            Word(word: "Artist", description: ""),
            Word(word: "Manager", description: ""),
            Word(word: "Tax", description: ""),
            Word(word: "Healthcare", description: ""),
            Word(word: "Planner", description: ""),
            Word(word: "IT Specialist", description: ""),
            Word(word: "Birthday", description: ""),
            Word(word: "Scientist", description: ""),
            Word(word: "Receptionist", description: ""),
            Word(word: "Actor", description: ""),
            Word(word: "Books", description: ""),
            Word(word: "Photographer", description: ""),
            Word(word: "Mathematician", description: ""),
            Word(word: "Writer", description: ""),
            Word(word: "Cylinder", description: ""),
            Word(word: "Therapist", description: ""),
            Word(word: "Software Dev", description: ""),
            Word(word: "Electrician", description: ""),
            Word(word: "Settle", description: ""),
            Word(word: "Lake", description: ""),
            Word(word: "Need", description: ""),
            Word(word: "Depression", description: ""),
            Word(word: "Mention", description: ""),
            Word(word: "Sunrise", description: ""),
            Word(word: "Monster", description: ""),
            Word(word: "Packet", description: ""),
            Word(word: "Rocket", description: ""),
            Word(word: "Sticky", description: ""),
            Word(word: "Tea", description: ""),
            Word(word: "Fresh", description: ""),
            Word(word: "Leftover", description: ""),
            Word(word: "Quote", description: ""),
            Word(word: "Get", description: ""),
            Word(word: "Modify", description: ""),
            Word(word: "Highlight", description: ""),
            Word(word: "Gather", description: ""),
            Word(word: "Lack", description: ""),
            Word(word: "Attract", description: ""),
            Word(word: "Push", description: ""),
            Word(word: "Attach", description: ""),
            Word(word: "Question", description: ""),
            Word(word: "Smile", description: ""),
            Word(word: "Reach", description: ""),
            Word(word: "Examine", description: ""),
            Word(word: "Hope", description: ""),
            Word(word: "Guarantee", description: ""),
            Word(word: "Fall", description: ""),
            Word(word: "Hope", description: ""),
            Word(word: "Fit", description: ""),
            Word(word: "Catch", description: ""),
            Word(word: "Heat", description: ""),
            Word(word: "Transmit", description: ""),
            Word(word: "Visit", description: ""),
            Word(word: "Worry", description: ""),
            Word(word: "Characterise", description: ""),
            Word(word: "Communicate", description: ""),
            Word(word: "Track", description: ""),
            Word(word: "Waste", description: ""),
            Word(word: "Clear", description: ""),
            Word(word: "Allow", description: ""),
            Word(word: "Start", description: ""),
            Word(word: "Mix", description: ""),
            Word(word: "Entertain", description: ""),
            Word(word: "Bound", description: ""),
            Word(word: "Deny", description: ""),
            Word(word: "Integrate", description: ""),
            Word(word: "Link", description: ""),
            Word(word: "Build", description: ""),
            Word(word: "Pin", description: ""),
            Word(word: "Rush", description: ""),
            Word(word: "Determine", description: ""),
            Word(word: "Dictate", description: ""),
            Word(word: "Discharge", description: ""),
            Word(word: "Furry", description: ""),
            Word(word: "Suitable", description: ""),
            Word(word: "Every", description: ""),
            Word(word: "Hard", description: ""),
            Word(word: "Nostalgic", description: ""),
            Word(word: "Amusing", description: ""),
            Word(word: "Sorry", description: ""),
            Word(word: "Women", description: ""),
            Word(word: "Bored", description: ""),
            Word(word: "Plucky", description: ""),
            Word(word: "Thoughtless", description: ""),
            Word(word: "Descriptive", description: ""),
            Word(word: "Even", description: ""),
            Word(word: "Smoggy", description: ""),
            Word(word: "Adaptable", description: ""),
            Word(word: "Comfortable", description: ""),
            Word(word: "Breezy", description: ""),
            Word(word: "Sharp", description: ""),
            Word(word: "Puny", description: ""),
            Word(word: "Useless", description: ""),
            Word(word: "Spare", description: ""),
            Word(word: "Left", description: ""),
            Word(word: "Lovely", description: ""),
            Word(word: "Abrupt", description: ""),
            Word(word: "Habitual", description: ""),
            Word(word: "Panoramic", description: ""),
            Word(word: "Tasteful", description: ""),
            Word(word: "Harsh", description: ""),
            Word(word: "Realistic", description: ""),
            Word(word: "Standing", description: ""),
            Word(word: "Funny", description: ""),
            Word(word: "Unique", description: ""),
            Word(word: "Polite", description: ""),
            Word(word: "Tension", description: ""),
            Word(word: "Crazy", description: ""),
            Word(word: "Educated", description: ""),
            Word(word: "Quiet", description: ""),
            Word(word: "Sad", description: "")
        ]
        
        displayingWords = fetchedWords
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = displayingWords?.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
}
