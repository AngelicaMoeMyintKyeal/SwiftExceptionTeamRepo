//
//  PhaseTwoMainView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct PhaseTwoMainView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var textFieldInput: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Spacer()
                    Header(
                        phase: 2,
                        title: "Compose",
                        description: "Out of the 20 words you choose, what do these 3 make you think about?"
                    )
                    Spacer()
                    
                    VStack {
                        var shuffledSelectedWords = vm.selectedWords.shuffled()
        
                        ForEach(0..<3, id:\.self) { index in
                            CompactWord(word: shuffledSelectedWords[index].word)
                        }
                    }
                    .padding(.horizontal)
                    
                                
                    Spacer()
                    ThinContainer {
                        TextField("Enter your app idea", text: $textFieldInput)
                    }
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Next Phase") {
                            // next phase action
                        }
                    }
                }
            }
        }
    }
}

struct PhaseTwoMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseTwoMainView()
            .environmentObject(ViewModel())
    }
}
