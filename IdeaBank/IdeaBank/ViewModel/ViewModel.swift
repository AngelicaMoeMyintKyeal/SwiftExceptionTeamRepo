//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var fetchedWords: [Word] = Word.exampleWords.shuffled()
    @Published var displayingWords: [Word] = []
    @Published var selectedWords: [Word] = []
//    @Published var words: [Word] = Word.exampleWords.shuffled()
    @Published var ideaArray: [Idea] = []
    @Published var savedIdeas: [Idea] = []
    
    private var wordCounter: Int = Word.exampleWords.count - 1
    
    init() {
        if displayingWords.isEmpty {
            for _ in 0...2 {
                displayingWords.append(fetchedWords[wordCounter])
                wordCounter -= 1
            }
        }
    }
    
    // Function to add new card to displayingWords array
    func addToDisplayingWords() {
        if wordCounter != 0 {
            displayingWords.append(fetchedWords[wordCounter])
            wordCounter -= 1
        } else {
            fetchedWords = fetchedWords.shuffled()
            wordCounter = Word.exampleWords.count - 1
        }
    }
    
    // Get the index of the user. This is used in the StackCardView
    func getIndex(word: Word) -> Int {
        let index = displayingWords.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
    
//    NOTE: We no longer require the API calls as they are not really necessary
    
//    private var words: [Word] = Word.exampleWords.shuffled()
//
//    init() {
//        Task {
//            for word in wordPool {
//                await fetchDefinition(randomWord: word.word)
//            }
//        }
//    }
//
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
//            print("API Called")
//        } catch {
//            print("Catch block!")
//            if words.isEmpty {
//                for word in wordPool {
//                    words.append(word)
//                }
//            }
//            print(error.localizedDescription)
//        }
//    }
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
            fetchedWords = placeholderWords
        case .emptyWords:
            fetchedWords = []
        case .filledSelectedWords:
            selectedWords = placeholderWords
        case .fillIdeaArray:
            ideaArray = placeholderIdeas
        }
    }
}

