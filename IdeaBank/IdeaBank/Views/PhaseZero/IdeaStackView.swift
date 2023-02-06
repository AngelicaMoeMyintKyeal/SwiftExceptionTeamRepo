//
//  IdeaStackView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 06/02/23.
//

import SwiftUI

struct IdeaStackView: View {
    @EnvironmentObject var VM: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(VM.savedIdeas) { idea in
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                ForEach(idea.parentWords, id: \.self) {
                                    Text("\($0)".uppercased())
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.bottom, 2.0)
                            Text(idea.body)
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.primary)
                        }
                        Spacer()
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                }
                .padding(.horizontal)
            }
            Spacer(minLength: 120)
        }
    }
}

struct IdeaStackView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaStackView()
    }
}
