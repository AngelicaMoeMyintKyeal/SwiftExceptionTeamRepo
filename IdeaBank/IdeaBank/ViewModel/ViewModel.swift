//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var fetchedWords: [Word] = []
    @Published var displayingWords: [Word]?
    @Published var selectedWords: [Word] = []
    @Published var words: [Word] = []
    
    private var wordPool: [String] = Word.exampleWords
    
    
    init() {
        Task {
            for word in wordPool {
                await fetchDefinition(randomWord: word)
            }
        }
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = words.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
    
    @MainActor
    func fetchDefinition(randomWord: String) async {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(randomWord)") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedWords = try JSONDecoder().decode([Word].self, from: data)
            self.words.append(contentsOf: decodedWords)
        } catch {
            print("Catch block!")
            print(error.localizedDescription)
        }
        
    }
    
}

// MARK: special code for canvas debugging
extension ViewModel {
    var placeholderWords: [Word] {
        var placeholders: [Word] = []
        for i in 0..<10 {
            placeholders.append(
                Word(
                    word: "Placeholder \(i)",
                    meanings: [
                        Meaning(
                            definitions: [
                                Definition(definition: "Meaning 1 - Definition 1"),
                                Definition(definition: "Meaning 1 - Definition 2")
                            ]
                        ),
                        Meaning(
                            definitions: [
                                Definition(definition: "Meaning 2 - Definition 1"),
                                Definition(definition: "Meaning 2 - Definition 2")
                            ]
                        )
                    ]
                )
            )
        }
        return placeholders
    }
    
    convenience init(showPlaceholders: Bool) {
        self.init()
        if showPlaceholders {
            words = placeholderWords
        } else {
            words = []
        }
    }
}

