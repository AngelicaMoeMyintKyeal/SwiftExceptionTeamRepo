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
                    
                    Header(
                        phase: 2,
                        title: "Compose",
                        description: "Out of the 20 words you choose, what do these 3 make you think about?"
                    )
                    Spacer()
                    
                    VStack {
                        var shuffledSelectedWords = vm.selectedWords
        
                        ForEach(0..<3, id:\.self) { index in
                            CompactWord(word: shuffledSelectedWords[index].word)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        TextField("Enter your idea", text: $textFieldInput)
                            .padding(/*@START_MENU_TOKEN@*/.leading, 16.0/*@END_MENU_TOKEN@*/)
                            .padding(/*@START_MENU_TOKEN@*/.all, 8.0/*@END_MENU_TOKEN@*/)
                            .background(.thinMaterial)
                            .clipShape(Capsule())
                            .padding(.trailing, 4.0)
                            
                        Button {
                            vm.selectedWords.shuffle()
                        } label: {
                            VStack(alignment: .center) {
                                Image(systemName: "square.and.arrow.down")
                                    
                                    .padding(10.0)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(Circle())
                        
                        Button {
                            vm.selectedWords.shuffle()
                        } label: {
                            VStack(alignment: .center) {
                                Image(systemName: "shuffle")
                                    .padding(10.0)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(Circle())
                        
                        
                    }
                    .padding(.horizontal)
                    
                    
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
