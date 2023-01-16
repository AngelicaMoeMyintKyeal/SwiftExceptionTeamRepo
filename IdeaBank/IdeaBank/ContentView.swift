//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    
    @State private var words: [Word] = []
    @State private var cardPool: [Word] = []
    
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                PhaseInformView(phaseHeader: "Phase 1", phaseTitle: "Choose", phaseDescription: "Swipe right to save a word if you like it or it inspires you, swipe right to discard it")
                
                Spacer()
                
                LazyVGrid(columns: layout, alignment: .leading) {
                    ForEach(words) { word in
                        CompactWordView(title: word.word)
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                    }
                }
                .padding()
                Spacer()
                Divider()
                
                ZStack {
                    if let words = vm.displayingWords {
                        if words.isEmpty {
                            Text("Nothing to display right now. Come back later...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        } else {
                            // Displaying cards
                            // Cards are reversed because it's a ZStack
                            // so you can use .reversed() on the forEach
                            ForEach(words.reversed()) { word in
                                // Card view
                                StackCardView(word: word)
                                    .frame(width: 220, height: 300)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
