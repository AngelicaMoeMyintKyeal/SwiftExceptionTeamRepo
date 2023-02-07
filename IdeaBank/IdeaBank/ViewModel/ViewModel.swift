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
    @Published var ideas: [Idea] = []
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
}

#if DEBUG
// MARK: special code for canvas preview
extension ViewModel {
    static var preview: ViewModel {
        let debugPreview = ViewModel()
        
        for i in 0..<10 {
            debugPreview.fetchedWords.append(Word.preview(withIndex: i))
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
