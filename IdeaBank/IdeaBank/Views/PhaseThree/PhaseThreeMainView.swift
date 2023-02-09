//
//  PhaseThreeMainView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 23/01/23.
//

import SwiftUI

struct PhaseThreeMainView: View {
    @EnvironmentObject var VM: ViewModel
    @Environment(\.managedObjectContext) var moc
    
    func pushToSalvation(idea: Idea) {
        let newIdea = StoredIdea(context: moc)
        newIdea.body = idea.body
        newIdea.parentWordOne = idea.parentWords[0]
        newIdea.parentWordTwo = idea.parentWords[1]
        newIdea.parentWordThree = idea.parentWords[2]
        newIdea.id = UUID()
        
        try? moc.save()
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Header(
                    title: "Confirm",
                    description: "These are all the ideas you generated, which ones do you like the most?"
                )
                ScrollView {
                    ForEach(VM.ideas) { idea in
                        IdeaAtCheckoutView(
                            usedWords: idea.parentWords,
                            title: "Idea",
                            description: idea.body,
                            isToggled: false
                        )
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top)
                .frame(maxWidth: .infinity)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        for idea in VM.ideas {
                            pushToSalvation(idea: idea)
                        }
                        VM.ideas = []
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

struct PhaseThreeMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseThreeMainView()
            .environmentObject(ViewModel.preview)
    }
}
