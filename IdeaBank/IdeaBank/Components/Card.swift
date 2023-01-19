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
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(word.word)
                        .font(.title)
                        .fontWeight(.bold)
//                    Text(vm.words[0].meanings[0].definitions[0].definition)
                    Spacer()
                }

                Spacer()
            }
            .padding(24)
            .background(.thinMaterial)
        }
        .onAppear {
            vm.fetchDefinition(randomWord: word.word)
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
//            Card(word: Word(
//                word: "Apple", meanings: ["An expensive computer", "A tool to keep doctors away"]
//            ))
            Card(
//                vm: ViewModel(),
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
