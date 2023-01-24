//
//  PhaseThreeMainView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 23/01/23.
//

import SwiftUI

struct PhaseThreeMainView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                
                Header(
                    phase: 3,
                    title: "Refine",
                    description: "These are all the ideas you generated, which ones do you like the most?"
                )
                
                ScrollView {
                    ForEach(vm.ideaArray) { x in
                        IdeaAtCheckoutView(usedWords: x.parentWords, title: "Idea", description: x.body, isToggled: false)
                    }
                }
                .padding(.top)
                .frame(maxWidth: .infinity)
                
                
            }
        }
    }
}

struct PhaseThreeMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseThreeMainView()
            .environmentObject(ViewModel(setPreviewWith: .fillIdeaArray))
    }
}
