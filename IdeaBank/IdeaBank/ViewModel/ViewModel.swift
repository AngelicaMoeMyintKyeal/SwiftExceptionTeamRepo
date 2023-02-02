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
    @Published var ideaArray: [Idea] = []
    
//    private var wordPool: [Word] = Word.exampleWords.shuffled()
    
    init() {
//        Task {
//            for word in wordPool {
//                await fetchDefinition(randomWord: word.word)
//            }
//        }
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = words.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
    
//    @MainActor
//    func fetchDefinition(randomWord: String) async {
//        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(randomWord)") else {
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodedWords = try JSONDecoder().decode([Word].self, from: data)
//            if decodedWords.count == 1 {
//                self.words.append(contentsOf: decodedWords)
//            } else {
//                let firstWord = decodedWords[0]
//                words.append(firstWord)
//            }
//        } catch {
//            print("Catch block!")
//            print(error.localizedDescription)
//        }
//    }
}

#if DEBUG
// MARK: special code for canvas preview
extension ViewModel {
    static var preview: ViewModel {
        let debugPreview = ViewModel()
        
        for _ in 0..<10 {
            debugPreview.words.append(Word.preview)
        }
        
        for _ in 0..<5 {
            debugPreview.ideaArray.append(Idea.preview)
        }
        
        return debugPreview
    }
}
#endif
