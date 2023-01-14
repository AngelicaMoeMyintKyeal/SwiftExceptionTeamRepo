//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var words: [Word] = Word.exampleWords
    @State private var cardPool: [Word] = []
    
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var x: [CGFloat] = [0, 0, 0, 0, 0, 0, 0]
    @State private var degree: [Double] = [0, 0, 0, 0, 0, 0, 0]

    var body: some View {
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
                ForEach(0..<6, id: \.self) { card in
                    
                    ForEach(cardPool) { word in
                        
                        CardView(title: word.word, description: word.description)
                            .offset(x: self.x[card])
                            .rotationEffect(.init(degrees: self.degree[card]))
                            .gesture(DragGesture()
                                .onChanged({ (value) in
                                    if value.translation.width > 0 {
                                        self.x[card] = value.translation.width
                                        self.degree[card] = 8
                                    } else {
                                        self.x[card] = value.translation.width
                                        self.degree[card] = -8
                                    }
                                    
                                    
                                })
                                .onEnded( { (value) in
                                    if value.translation.width > 0 {
                                        if value.translation.width > 100 {
                                            self.x[card] = 500
                                            self.degree[card] = 15
                                        } else {
                                            self.x[card] = 0
                                            self.degree[card] = 0
                                        }
                                    } else {
                                        if value.translation.width < -100 {
                                            self.x[card] = -500
                                            self.degree[card] = -15
                                        } else {
                                            self.x[card] = 0
                                            self.degree[card] = 0
                                        }
                                    }
                                        
                                        
                                })
                            )
                        
                    }
                }
                
    //            SwipeCarousel(items: words, id: \.id) { word, size in
    //                CardView(title: word.word, description: word.description)
    //                    .frame(width: 240, height: 200)
    //
    //            }
                // Card size specified here, otherwise whole screen will be occupied
                .frame(width: 220, height: 300)
            }
        }
        .onAppear {
            cardPool.append(words.randomElement()!)
            cardPool.append(words.randomElement()!)
            cardPool.append(words.randomElement()!)
            cardPool.append(words.randomElement()!)
        }
        .background(
            LinearGradient(colors: [.black, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
