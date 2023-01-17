//
//  GridView.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        LazyVGrid(columns: vm.layout, alignment: .leading) {
            ForEach(vm.selectedWords) { word in
                CompactWordView(title: word.word)
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
        GridView()
    }
}
