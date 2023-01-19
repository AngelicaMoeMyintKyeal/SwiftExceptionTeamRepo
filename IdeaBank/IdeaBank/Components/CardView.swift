//
//  CardView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 11/01/23.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var vm: ViewModel
    var word: Word
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(word.word)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(word.meanings[0].definitions[0].definition)
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

//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(word: Word(word: "Test word", defs: Words(meanings: [Meaning(definitions: [Definition(definition: "Definition of stuff here")])])))
//    }
//}
