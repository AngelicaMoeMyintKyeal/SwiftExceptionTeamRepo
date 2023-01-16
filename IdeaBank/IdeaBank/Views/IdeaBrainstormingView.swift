//
//  IdeaBrainstormingView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 16/01/23.
//

import SwiftUI

struct IdeaBrainstormingView: View {
    @State private var userInput = ""
    var words = ["placeholder_0", "placeholder_1", "placeholder_2", "placeholder_3", "placeholder_4", "placeholder_5", "placeholder_6", "placeholder_7", "placeholder_8", "placeholder_9"]
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    ForEach(0..<5) { i in
                        HStack {
                            ForEach(0..<2) { i2 in
                                ZStack {
                                    ThinRoundedRectangle()
                                    Text(words[i * 2 + i2])
                                        .padding(
                                            Edge.Set.horizontal,
                                            10
                                        )
                                }
                                .frame(
                                    width: nil,
                                    height: 50
                                )
                            }
                        }
                    }
                }
                .frame(
                    width: nil,
                    height: geo.size.height * 0.7
                )
                Spacer()
                Divider()
                ZStack {
                    ThinRoundedRectangle()
                    TextField("", text: $userInput)
                        .padding(20)
                }
                .frame(
                    width: nil,
                    height: geo.size.height * 0.2
                )
            }
            .background(
                LinearGradient(
                    colors: [.indigo, .purple],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

struct ThinRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(.ultraThinMaterial, lineWidth: 3)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.thinMaterial)
                    .opacity(0.5)
            )
            .padding(10)
    }
}

struct IdeaBrainstormingView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaBrainstormingView()
    }
}
