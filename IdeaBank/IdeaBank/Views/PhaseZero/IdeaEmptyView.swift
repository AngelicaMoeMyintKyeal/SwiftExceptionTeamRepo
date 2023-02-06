//
//  IdeaEmptyView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 06/02/23.
//

import SwiftUI

struct IdeaEmptyView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("There's a void here.")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            Text("You can fill it.")
                .font(.largeTitle)
                .fontWeight(.medium)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct IdeaEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaEmptyView()
    }
}
