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
            Color(uiColor: .systemBackground),
            Color(uiColor: .systemPurple)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
