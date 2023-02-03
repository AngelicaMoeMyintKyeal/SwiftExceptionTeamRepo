//
//  ViewModel.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var selectedWords: [Word] = []
    @Published var words: [Word] = []
    @Published var ideaArray: [Idea] = []
    
    init() {
    }
    
    // Get the index of the user
    func getIndex(word: Word) -> Int {
        let index = words.firstIndex(where: { currentWord in
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
