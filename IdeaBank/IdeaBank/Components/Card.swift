//
//  Card.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 17/01/23.
//

import SwiftUI

struct Card: View {
    @EnvironmentObject var vm: ViewModel
    var word: Word
    
    var body: some View {
            HStack {
                Spacer()
                Text(word.word)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(24)
            .frame(height: 180)
            .background(.thinMaterial)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.4),radius: 3, x: 2, y: -1)
    }
    
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Card(
                word: Word(
                    word: "Apple",
                    meanings: [
                        Meaning(
                            definitions: [
                                Definition(definition: "An expensive computer"),
                                Definition(definition: "A tool to keep doctors away")
                            ]
                        )
                    ]
                )
            )
            .environmentObject(ViewModel())
        }
    }
}
