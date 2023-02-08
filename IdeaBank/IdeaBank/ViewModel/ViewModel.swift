//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var displayingWords: [Word] = []
    @Published var selectedWords: [Word] = []
    @Published var words: [Word] = []
    @Published var ideas: [Idea] = []
    @Published var savedIdeas: [Idea] = []
    
    private var wordIndex: Int = 0 {
        didSet {
            if wordIndex < 0 || wordIndex == Word.pool.count - 1 {
                wordIndex = 0
                words = words.shuffled()
            }
        }
    }
    
    init() {
        for wordInPool in Word.pool.shuffled() {
            words.append(Word(word: wordInPool, definition: ""))
        }
        for _ in 0..<3 {
            displayingWords.append(words[wordIndex])
            wordIndex += 1
        }
    }
    
    // Add new card to displayingWords array
    func addToDisplayingWords() {
        displayingWords.append(words[wordIndex])
        wordIndex += 1
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = displayingWords.firstIndex(where: { currentWord in
            return word.id == currentWord.id
        }) ?? 0
        
        return index
    }
}

#if DEBUG
// MARK: special code for canvas preview
extension ViewModel {
    static var preview: ViewModel {
        let debugPreview = ViewModel()
        
        for i in 0..<10 {
            debugPreview.words.append(Word.preview(withIndex: i))
        }
        
        for i in 0..<3 {
            debugPreview.selectedWords.append(Word.preview(withIndex: i))
        }
        
        for i in 0..<5 {
            debugPreview.ideas.append(Idea.preview(withIndex: i))
        }
        
        return debugPreview
    }
}
#endif
