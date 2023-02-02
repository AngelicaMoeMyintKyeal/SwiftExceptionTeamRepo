//
//  Card.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 17/01/23.
//

import SwiftUI

struct Card: View {
    var word: Word
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(word.word)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(word.definition)
                    Spacer()
                }
                Spacer()
            }
            .padding(24)
            .background(.thinMaterial)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.secondary, lineWidth: 4)
                .padding(-2)
                .opacity(0.5)
        )
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Card(word: Word(
                word: "Apple",
                definition: "An expensive computer"
            ))
            .environmentObject(ViewModel())
        }
    }
}
