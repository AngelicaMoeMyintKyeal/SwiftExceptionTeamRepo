//
//  WordCard.swift
//  IdeaBank
//
//  Created by シェイミ on 11/01/2023.
//

import SwiftUI

// MARK: Sample Message Model
struct Word: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var word: String
    var description: String
}
