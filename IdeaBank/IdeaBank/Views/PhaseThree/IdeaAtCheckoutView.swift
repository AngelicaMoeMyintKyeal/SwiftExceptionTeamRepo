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
    @State var isToggled: Bool = false
    
    var body: some View {
        Button {
            isToggled.toggle()
        } label: {
            Group {
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
                                .foregroundColor(.primary)
                            Text(description)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                        isToggled ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .frame(width: 340)
                    .cornerRadius(20)
                }
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(isToggled ? .primary : .secondary, lineWidth: 4)
//                        .padding(-2)
//                        .opacity(isToggled ? 1 : 0.0)
//                )
            }
        }
    }
}

struct IdeaAtCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaAtCheckoutView(
            usedWords: ["Louie", "Huey", "Dewey"],
            title: "Roasted Duck",
            description: "A really cool idea that will feed me"
        )
    }
}
