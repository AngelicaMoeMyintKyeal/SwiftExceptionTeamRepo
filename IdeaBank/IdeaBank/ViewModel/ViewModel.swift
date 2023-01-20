//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    private var wordPool: [String] = Word.exampleWords
    
    @Published var fetchedWords: [Word] = []
    @Published var displayingWords: [Word]?
    @Published var selectedWords: [Word] = []
    
    @Published var words: [Word] = []
    
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



