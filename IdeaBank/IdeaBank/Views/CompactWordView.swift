//
//  CompactWordView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 11/01/23.
//

import SwiftUI

struct CompactWordView: View {
    
    var title: String
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.medium)
        }
        .padding(16)
        .frame(height: 50)
        .background(.thinMaterial)
        .cornerRadius(8)
    }
}

struct CompactWordView_Previews: PreviewProvider {
    static var previews: some View {
        CompactWordView(title: "Word 1")
    }
}
