//
//  CompactWord.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 18/01/23.
//

import SwiftUI

struct CompactWord: View {
    var word: String
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(word)
                    .fontWeight(.medium)
                Spacer()
            }
        }
        .padding(15)
        .frame(height: 50)
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

struct CompactWord_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            CompactWord(word: "Pizza")
        }
    }
}
