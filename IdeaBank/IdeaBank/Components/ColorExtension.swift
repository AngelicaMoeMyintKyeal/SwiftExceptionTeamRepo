//
//  ColorExtension.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 18/01/23.
//

import SwiftUI

extension Color {
    static let background = LinearGradient(
        colors: [
            Color("mainColor1"),
            .purple
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let main = Color("mainColor1")
}
