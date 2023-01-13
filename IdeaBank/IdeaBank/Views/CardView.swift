//
//  CardView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 11/01/23.
//

import SwiftUI

struct CardView: View {

    var title: String
    var description: String

    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(description)
                    Spacer()
                }
                Spacer()
            }
            .padding(24)
            .background(.thinMaterial)
            .frame(width: 300, height: 200)
            .cornerRadius(20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.secondary, lineWidth: 4)
                .padding(-2)
                .opacity(0.5)
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Word 1", description: "This is a long description")
    }
}
