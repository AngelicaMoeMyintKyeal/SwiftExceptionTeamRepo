//
//  Card.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 17/01/23.
//

import SwiftUI

struct Card: View {
    var word: String
    
    var body: some View {
            HStack {
                Spacer()
                Text(word)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(24)
            .frame(height: 180)
            .background(.thinMaterial)
            .cornerRadius(20)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Card(word: "Apple")
        }
    }
}
