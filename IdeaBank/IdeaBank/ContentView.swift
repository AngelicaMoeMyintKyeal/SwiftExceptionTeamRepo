//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var words: [Word] = Word.exampleWords
    
    var body: some View {
        VStack {
            Spacer()
            Divider()
            
            SwipeCarousel(items: words, id: \.id) { word, size in
                // Custom View goes here
                VStack {
                    Text(word.word)
                        .bold()
                        .padding()
                    Text(word.description)
                        .padding()
                }
                
                .frame(width: 240, height: 200)
                .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 15))
                
            }
            // Card size specified here, otherwise whole screen will be occupied
            .frame(width: 220, height: 300)
            
        }
        .background(
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
