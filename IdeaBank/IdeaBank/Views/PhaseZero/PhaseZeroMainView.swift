//
//  PhaseZeroMainView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 31/01/23.
//

import SwiftUI

struct PhaseZeroMainView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if vm.savedIdeas.count == 0 {
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
                } else {
                    ScrollView {
                        ForEach(vm.savedIdeas) { idea in
                            SavedIdea(usedWords: idea.parentWords, description: idea.body)
                        }
                        Spacer(minLength: 120)
                    }
                }
                VStack {
                    Spacer()
                    VStack {
                        NavigationLink {
                            PhaseOneMainView()
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "brain")
                                Text("Start Brainstorming")
                                Spacer()
                            }
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .background(.purple)
                            .cornerRadius(20)
                            .padding()
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            vm.selectedWords = []
                        })
                    }
                    .background(.thinMaterial)
                }
            }
            .navigationTitle("IdeaBank")
        }
    }
}

struct PhaseZeroMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseZeroMainView()
            .environmentObject(ViewModel.preview)
    }
}

