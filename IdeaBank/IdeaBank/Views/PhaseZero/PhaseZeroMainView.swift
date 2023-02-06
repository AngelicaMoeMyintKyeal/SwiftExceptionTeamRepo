//
//  PhaseZeroMainView.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 06/02/23.
//

import SwiftUI

struct PhaseZeroMainView: View {
    @EnvironmentObject var VM: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if VM.savedIdeas.count == 0 {
                    IdeaEmptyView()
                } else {
                    IdeaStackView()
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

