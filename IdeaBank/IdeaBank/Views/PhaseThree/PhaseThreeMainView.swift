//
//  PhaseThreeMainView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 23/01/23.
//

import SwiftUI

struct PhaseThreeMainView: View {
    @EnvironmentObject var vm: ViewModel
    
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
                    ForEach(vm.ideaArray) { x in
                        IdeaAtCheckoutView(usedWords: x.parentWords, title: "Idea", description: x.body, isToggled: false)
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top)
                .frame(maxWidth: .infinity)
                
                
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        
                        for x in vm.ideaArray {
                            pushToSalvation(idea: x)
                        }
                        
//                        vm.savedIdeas.append(contentsOf: vm.ideaArray)
                        vm.ideaArray = []
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
