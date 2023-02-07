//
//  HeaderView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 17/01/23.
//

import SwiftUI

struct Header: View {
    var title: String
    var description: String
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.primary)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            Text(description)
                .font(.caption)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 32.0)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            Header(
                title: "Plus 2 is 4",
                description: "Minus 1 that's 3, quick maths. Everyday man's on the block, smoke trees. See your girl in the park, that girl is a uckers. When the ting went quack-quack-quak, you man were ducking"
            )
        }
    }
}
