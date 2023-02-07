//
//  SavedIdea.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 31/01/23.
//

import SwiftUI

struct SavedIdea: View {
    var usedWords: [String] = []
    var description: String
    
    var body: some View {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(usedWords, id: \.self) {
                                Text("\($0)".uppercased())
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.bottom, 2.0)
                        Text(description)
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding(16)
                .background(.thinMaterial)
                .cornerRadius(20)
            }
            .padding(.horizontal)
    }
}

struct SavedIdea_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            SavedIdea(
                usedWords: ["one", "two", "three"],
                description: "Abc"
            )
        }
    }
}
