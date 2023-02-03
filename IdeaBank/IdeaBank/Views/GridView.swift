//
//  GridView.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var vm: ViewModel
    
    private var layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, alignment: .leading) {
            ForEach(vm.selectedWords) { word in
                CompactWord(word: word.word)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
            }
        }
        .frame(height: 300)
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            GridView()
                .environmentObject(ViewModel(setPreviewWith: .filledSelectedWords))
        }
    }
}
