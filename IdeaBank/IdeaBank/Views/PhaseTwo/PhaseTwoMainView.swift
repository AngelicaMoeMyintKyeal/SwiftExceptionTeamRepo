//
//  PhaseTwoMainView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct PhaseTwoMainView: View {
    @EnvironmentObject var VM: ViewModel
    @State private var textFieldInput: String = ""
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Header(
                        title: "Compose",
                        description: "Out of all the words you've chosen, what do these three make you think about?"
                    )
                    Spacer()
                    VStack {
//                        var shuffledSelectedWords = vm.selectedWords
                        ForEach(0..<3, id:\.self) { index in
                            CompactWord(word: VM.selectedWords[index].word)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    HStack {
                        TextField("Enter your idea", text: $textFieldInput)
                            .padding(.leading, 16.0)
                            .padding(.all, 8.0)
                            .background(.thinMaterial)
                            .clipShape(Capsule())
                            .padding(.trailing, 4.0)
                            .keyboardType(.default)
                        Button {
                            VM.ideas.append(Idea(body: textFieldInput, parentWords: [VM.selectedWords[0].word, VM.selectedWords[1].word, VM.selectedWords[2].word]))
                            
                            print(VM.ideas)
                            print("\n")
                            textFieldInput = ""
                            VM.selectedWords.shuffle()
                        } label: {
                            VStack(alignment: .center) {
                                Image(systemName: "square.and.arrow.down")
                                    
                                    .padding(10.0)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(Circle())
                        Button {
                            VM.selectedWords.shuffle()
                        } label: {
                            VStack(alignment: .center) {
                                Image(systemName: "shuffle")
                                    .padding(10.0)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(Circle())
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Next", destination: PhaseThreeMainView())
                    }
                }
            }
        }
    }
}

struct PhaseTwoMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseTwoMainView()
            .environmentObject(ViewModel.preview)
    }
}
