//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    // FetchedWords is all words, displayingWords is a subset that
    // will be updated based on user interaction to reduce memory usage
    
    
    @Published var fetchedWords: [Word] = []
    @Published var displayingWords: [Word]?
    @Published var selectedWords: [Word] = []
    
    @Published var words: [Word] = []
    
    init() {
//        fetchedWords = [
//            Word(word: "Monkey"),
//            Word(word: "Banana"),
//            Word(word: "Chicken"),
//            Word(word: "Contrary"),
//            Word(word: "Cantankerous"),
//            Word(word: "University"),
//            Word(word: "Professor"),
//            Word(word: "Message"),
//            Word(word: "Shy"),
//            Word(word: "Food"),
//            Word(word: "Educator"),
//            Word(word: "Fitness Instructor"),
//            Word(word: "Number"),
//            Word(word: "Anxiety"),
//            Word(word: "Cook"),
//            Word(word: "Hairdresser"),
//            Word(word: "Pressure"),
//            Word(word: "Engineering"),
//            Word(word: "Artist"),
//            Word(word: "Manager"),
//            Word(word: "Tax"),
//            Word(word: "Healthcare"),
//            Word(word: "Planner"),
//            Word(word: "IT Specialist"),
//            Word(word: "Birthday"),
//            Word(word: "Scientist"),
//            Word(word: "Receptionist"),
//            Word(word: "Actor"),
//            Word(word: "Books"),
//            Word(word: "Photographer"),
//            Word(word: "Mathematician"),
//            Word(word: "Writer"),
//            Word(word: "Cylinder"),
//            Word(word: "Therapist"),
//            Word(word: "Software Dev"),
//            Word(word: "Electrician"),
//            Word(word: "Settle"),
//            Word(word: "Lake"),
//            Word(word: "Need"),
//            Word(word: "Depression"),
//            Word(word: "Mention"),
//            Word(word: "Sunrise"),
//            Word(word: "Monster"),
//            Word(word: "Packet"),
//            Word(word: "Rocket"),
//            Word(word: "Sticky"),
//            Word(word: "Tea"),
//            Word(word: "Fresh"),
//            Word(word: "Leftover"),
//            Word(word: "Quote"),
//            Word(word: "Get"),
//            Word(word: "Modify"),
//            Word(word: "Highlight"),
//            Word(word: "Gather"),
//            Word(word: "Lack"),
//            Word(word: "Attract"),
//            Word(word: "Push"),
//            Word(word: "Attach"),
//            Word(word: "Question"),
//            Word(word: "Smile"),
//            Word(word: "Reach"),
//            Word(word: "Examine"),
//            Word(word: "Hope"),
//            Word(word: "Guarantee"),
//            Word(word: "Fall"),
//            Word(word: "Hope"),
//            Word(word: "Fit"),
//            Word(word: "Catch"),
//            Word(word: "Heat"),
//            Word(word: "Transmit"),
//            Word(word: "Visit"),
//            Word(word: "Worry"),
//            Word(word: "Characterise"),
//            Word(word: "Communicate"),
//            Word(word: "Track"),
//            Word(word: "Waste"),
//            Word(word: "Clear"),
//            Word(word: "Allow"),
//            Word(word: "Start"),
//            Word(word: "Mix"),
//            Word(word: "Entertain"),
//            Word(word: "Bound"),
//            Word(word: "Deny"),
//            Word(word: "Integrate"),
//            Word(word: "Link"),
//            Word(word: "Build"),
//            Word(word: "Pin"),
//            Word(word: "Rush"),
//            Word(word: "Determine"),
//            Word(word: "Dictate"),
//            Word(word: "Discharge"),
//            Word(word: "Furry"),
//            Word(word: "Suitable"),
//            Word(word: "Every"),
//            Word(word: "Hard"),
//            Word(word: "Nostalgic"),
//            Word(word: "Amusing"),
//            Word(word: "Sorry"),
//            Word(word: "Women"),
//            Word(word: "Bored"),
//            Word(word: "Plucky"),
//            Word(word: "Thoughtless"),
//            Word(word: "Descriptive"),
//            Word(word: "Even"),
//            Word(word: "Smoggy"),
//            Word(word: "Adaptable"),
//            Word(word: "Comfortable"),
//            Word(word: "Breezy"),
//            Word(word: "Sharp"),
//            Word(word: "Puny"),
//            Word(word: "Useless"),
//            Word(word: "Spare"),
//            Word(word: "Left"),
//            Word(word: "Lovely"),
//            Word(word: "Abrupt"),
//            Word(word: "Habitual"),
//            Word(word: "Panoramic"),
//            Word(word: "Tasteful"),
//            Word(word: "Harsh"),
//            Word(word: "Realistic"),
//            Word(word: "Standing"),
//            Word(word: "Funny"),
//            Word(word: "Unique"),
//            Word(word: "Polite"),
//            Word(word: "Tension"),
//            Word(word: "Crazy"),
//            Word(word: "Educated"),
//            Word(word: "Quiet"),
//            Word(word: "Sad")
//        ]
        
        displayingWords = fetchedWords
        
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = displayingWords?.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
    
    func fetchDefinition(randomWord: String) {
        
        guard let wordDefURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(randomWord)") else { fatalError("Missing URL") }
        
        /// for testing temporarily
        //        guard let wordDefURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\happy") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: wordDefURL)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error {
                print("Request Error:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                guard let data = data  else {return}
                DispatchQueue.main.async {
                    do {
                        let decodedWords = try JSONDecoder().decode([Word].self, from: data)
                        self.words = decodedWords
                    } catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}




//        fetchedWords = [
//            Word(word: "Monkey", description: "A kind of simian"),
//            Word(word: "Banana", description: "Fruit that a monkey likes to eat"),
//            Word(word: "Chicken", description: "Everyone's favourite snack"),
//            Word(word: "Contrary", description: "Mary, Mary...."),
//            Word(word: "Cantankerous", description: "A description of myself in the morning"),
//            Word(word: "University", description: ""),
//            Word(word: "Professor", description: ""),
//            Word(word: "Message", description: ""),
//            Word(word: "Shy", description: ""),
//            Word(word: "Food", description: ""),
//            Word(word: "Educator", description: ""),
//            Word(word: "Fitness Instructor", description: ""),
//            Word(word: "Number", description: ""),
//            Word(word: "Anxiety", description: ""),
//            Word(word: "Cook", description: ""),
//            Word(word: "Hairdresser", description: ""),
//            Word(word: "Pressure", description: ""),
//            Word(word: "Engineering", description: ""),
//            Word(word: "Artist", description: ""),
//            Word(word: "Manager", description: ""),
//            Word(word: "Tax", description: ""),
//            Word(word: "Healthcare", description: ""),
//            Word(word: "Planner", description: ""),
//            Word(word: "IT Specialist", description: ""),
//            Word(word: "Birthday", description: ""),
//            Word(word: "Scientist", description: ""),
//            Word(word: "Receptionist", description: ""),
//            Word(word: "Actor", description: ""),
//            Word(word: "Books", description: ""),
//            Word(word: "Photographer", description: ""),
//            Word(word: "Mathematician", description: ""),
//            Word(word: "Writer", description: ""),
//            Word(word: "Cylinder", description: ""),
//            Word(word: "Therapist", description: ""),
//            Word(word: "Software Dev", description: ""),
//            Word(word: "Electrician", description: ""),
//            Word(word: "Settle", description: ""),
//            Word(word: "Lake", description: ""),
//            Word(word: "Need", description: ""),
//            Word(word: "Depression", description: ""),
//            Word(word: "Mention", description: ""),
//            Word(word: "Sunrise", description: ""),
//            Word(word: "Monster", description: ""),
//            Word(word: "Packet", description: ""),
//            Word(word: "Rocket", description: ""),
//            Word(word: "Sticky", description: ""),
//            Word(word: "Tea", description: ""),
//            Word(word: "Fresh", description: ""),
//            Word(word: "Leftover", description: ""),
//            Word(word: "Quote", description: ""),
//            Word(word: "Get", description: ""),
//            Word(word: "Modify", description: ""),
//            Word(word: "Highlight", description: ""),
//            Word(word: "Gather", description: ""),
//            Word(word: "Lack", description: ""),
//            Word(word: "Attract", description: ""),
//            Word(word: "Push", description: ""),
//            Word(word: "Attach", description: ""),
//            Word(word: "Question", description: ""),
//            Word(word: "Smile", description: ""),
//            Word(word: "Reach", description: ""),
//            Word(word: "Examine", description: ""),
//            Word(word: "Hope", description: ""),
//            Word(word: "Guarantee", description: ""),
//            Word(word: "Fall", description: ""),
//            Word(word: "Hope", description: ""),
//            Word(word: "Fit", description: ""),
//            Word(word: "Catch", description: ""),
//            Word(word: "Heat", description: ""),
//            Word(word: "Transmit", description: ""),
//            Word(word: "Visit", description: ""),
//            Word(word: "Worry", description: ""),
//            Word(word: "Characterise", description: ""),
//            Word(word: "Communicate", description: ""),
//            Word(word: "Track", description: ""),
//            Word(word: "Waste", description: ""),
//            Word(word: "Clear", description: ""),
//            Word(word: "Allow", description: ""),
//            Word(word: "Start", description: ""),
//            Word(word: "Mix", description: ""),
//            Word(word: "Entertain", description: ""),
//            Word(word: "Bound", description: ""),
//            Word(word: "Deny", description: ""),
//            Word(word: "Integrate", description: ""),
//            Word(word: "Link", description: ""),
//            Word(word: "Build", description: ""),
//            Word(word: "Pin", description: ""),
//            Word(word: "Rush", description: ""),
//            Word(word: "Determine", description: ""),
//            Word(word: "Dictate", description: ""),
//            Word(word: "Discharge", description: ""),
//            Word(word: "Furry", description: ""),
//            Word(word: "Suitable", description: ""),
//            Word(word: "Every", description: ""),
//            Word(word: "Hard", description: ""),
//            Word(word: "Nostalgic", description: ""),
//            Word(word: "Amusing", description: ""),
//            Word(word: "Sorry", description: ""),
//            Word(word: "Women", description: ""),
//            Word(word: "Bored", description: ""),
//            Word(word: "Plucky", description: ""),
//            Word(word: "Thoughtless", description: ""),
//            Word(word: "Descriptive", description: ""),
//            Word(word: "Even", description: ""),
//            Word(word: "Smoggy", description: ""),
//            Word(word: "Adaptable", description: ""),
//            Word(word: "Comfortable", description: ""),
//            Word(word: "Breezy", description: ""),
//            Word(word: "Sharp", description: ""),
//            Word(word: "Puny", description: ""),
//            Word(word: "Useless", description: ""),
//            Word(word: "Spare", description: ""),
//            Word(word: "Left", description: ""),
//            Word(word: "Lovely", description: ""),
//            Word(word: "Abrupt", description: ""),
//            Word(word: "Habitual", description: ""),
//            Word(word: "Panoramic", description: ""),
//            Word(word: "Tasteful", description: ""),
//            Word(word: "Harsh", description: ""),
//            Word(word: "Realistic", description: ""),
//            Word(word: "Standing", description: ""),
//            Word(word: "Funny", description: ""),
//            Word(word: "Unique", description: ""),
//            Word(word: "Polite", description: ""),
//            Word(word: "Tension", description: ""),
//            Word(word: "Crazy", description: ""),
//            Word(word: "Educated", description: ""),
//            Word(word: "Quiet", description: ""),
//            Word(word: "Sad", description: "")
//        ]
