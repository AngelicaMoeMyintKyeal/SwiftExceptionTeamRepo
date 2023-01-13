//
//  IdeaAtCheckoutView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 12/01/23.
//

import SwiftUI

struct IdeaAtCheckoutView: View {
    
    var usedWords = [String]()
    var title: String
    var description: String
    var isToggled: Bool = true
    
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
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 2.0)
                    Text(description)
                    
                }
                Spacer()
            }
            .padding(16)
            .background(.thinMaterial)
            .frame(width: 340)
            .cornerRadius(20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isToggled ? .primary : .secondary, lineWidth: 4)
                .padding(-2)
                .opacity(isToggled ? 1 : 0.0)
        )
    }
}

struct IdeaAtCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaAtCheckoutView(usedWords: ["word 1", "word 2", "word 3"], title: "Idea 1", description: "A really cool idea that will make me millions")
    }
}
