//
//  PhaseZeroMainView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 31/01/23.
//

import SwiftUI

struct PhaseZeroMainView: View {
    @EnvironmentObject var VM: ViewModel
    @FetchRequest(sortDescriptors: []) var storedIdeas: FetchedResults<StoredIdea>
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                if storedIdeas.count == 0 {
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
                        ForEach(storedIdeas) { idea in
                            SavedIdea(
                                usedWords: [
                                    idea.parentWordOne ?? "unknown 1",
                                    idea.parentWordTwo ?? "unknown 2",
                                    idea.parentWordThree ?? "unknown 3"
                                ],
                                description: idea.body ?? "unknown description"
                            )
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
                            VM.selectedWords = []
                        })
                    }
                    .background(.thinMaterial)
                }
            }
            .navigationTitle("Ideas")
        }
    }
}

struct PhaseZeroMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseZeroMainView()
            .environmentObject(ViewModel.preview)
    }
}

