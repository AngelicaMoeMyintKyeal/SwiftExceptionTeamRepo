//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var words: [Word] = Word.exampleWords
    @State private var deck: [Word] = []
    @State private var selectedWords: [Word] = []

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            LazyVGrid(columns: layout, alignment: .leading) {
                ForEach(selectedWords) { word in
                    CompactWordView(title: word.word)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
            }
            .padding()
            Spacer()
            Divider()

            SwipeCarousel(items: deck, id: \.id) { word, size in
                CardView(title: word.word, description: word.description)
                    .frame(width: 240, height: 200)

            }
            // Card size specified here, otherwise whole screen will be occupied
            .frame(width: 220, height: 300)

        }
        .background(
            LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
        )
        .onAppear {
            deck.append(words.randomElement()!)
            deck.append(words.randomElement()!)
            deck.append(words.randomElement()!)
            deck.append(words.randomElement()!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
