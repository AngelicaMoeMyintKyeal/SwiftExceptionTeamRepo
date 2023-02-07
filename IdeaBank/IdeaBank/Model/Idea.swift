//
//  Idea.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 13/01/23.
//

import Foundation

struct Idea: Identifiable, Codable {
    var id = UUID()
    var body: String
    var parentWords: [String] = []
}

#if DEBUG
// MARK: special code for canvas preview
extension Idea {
    static func preview(withIndex: Int = -1) -> Idea {
        if withIndex > -1 {
            return Idea(
                body: "Roasted Duck \(withIndex)",
                parentWords: ["Louie \(withIndex)", "Huey \(withIndex)", "Dewey \(withIndex)"]
            )
        } else {
            return Idea(
                body: "Roasted Duck",
                parentWords: ["Louie", "Huey", "Dewey"]
            )
        }
    }
}
#endif
