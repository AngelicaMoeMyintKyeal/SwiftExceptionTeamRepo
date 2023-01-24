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
                    word: "Laziness \(i)",
                    meanings: [
                        Meaning(
                            definitions: [
                                Definition(definition: "The art of taking rest before getting tired. Because prevention is better than cure"),
                                Definition(definition: "Me")
                            ]
                        ),
                        Meaning(
                            definitions: [
                                Definition(definition: "If you see me, be worried"),
                                Definition(definition: "If you also see me, run")
                            ]
                        )
                    ]
                )
            )
        }
        return placeholders
    }
    
    var placeholderIdeas: [Idea] {
        var placeholders: [Idea] = []
        for i in 0..<5 {
            placeholders.append(
                Idea(
                    body: "Roasted Duck \(i)",
                    parentWords: [
                        "Louie \(i)",
                        "Huey \(i)",
                        "Dewey \(i)"
                    ]
                )
            )
        }
        return placeholders
    }
    
    enum canvasPreview {
        case filledWords
        case emptyWords
        case filledSelectedWords
        case fillIdeaArray
    }
    
    convenience init(setPreviewWith previewType: canvasPreview) {
        self.init()
        switch previewType {
        case .filledWords:
            words = placeholderWords
        case .emptyWords:
            words = []
        case .filledSelectedWords:
            selectedWords = placeholderWords
        case .fillIdeaArray:
            ideaArray = placeholderIdeas
        }
    }
}

