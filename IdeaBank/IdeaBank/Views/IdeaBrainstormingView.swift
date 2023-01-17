//
//  IdeaBrainstormingView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 16/01/23.
//

import SwiftUI

struct IdeaBrainstormingView: View {
    @State private var userInput = ""
    init(words: [String] = ["placeholder_0", "placeholder_1", "placeholder_2", "placeholder_3", "placeholder_4", "placeholder_5", "placeholder_6", "placeholder_7", "placeholder_8", "placeholder_9"]) {
        self.words = words
    }
    var words: [String]
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    ForEach(0..<5) { i in
                        HStack {
                            ForEach(0..<2) { i2 in
                                ThinContainer {
                                    Text(words[i * 2 + i2])
                                }
                            }
                        }
                    }
                }
                .frame(
                    height: geo.size.height * 0.7
                )
                Spacer()
                Divider()
                ThinContainer {
                    TextField("", text: $userInput)
                }
                .frame(
                    height: geo.size.height * 0.2
                )
            }
            .padding(10)
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


/// A view that puts its subviews in a custom container based on the RoundedRectangle shape
struct ThinContainer<Content: View>: View {
    var content: () -> Content
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.thinMaterial)
            .overlay(content: content)
    }
}

/*
// how to add a custom modifier
struct ThinBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(.thinMaterial)
            )
    }
}

extension View {
    /// Adds a custom padding and background to this view
    func thinBackground() -> some View {
        modifier(ThinBackground())
    }
}
*/

struct IdeaBrainstormingView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaBrainstormingView()
    }
}
