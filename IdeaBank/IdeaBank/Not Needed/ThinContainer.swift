//
//  ThinContainer.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 17/01/23.
//

import SwiftUI

struct ThinContainer<Content: View>: View {
    var content: () -> Content
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.thinMaterial)
            .overlay(content: content)
    }
}

struct ThinContainer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ThinContainer {
                Text("An apple a day keeps anyone away if you throw it hard enough")
            }
        }
    }
}
