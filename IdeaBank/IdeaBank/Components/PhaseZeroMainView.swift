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

            VStack {
                
                NavigationLink("Next", destination: PhaseOneMainView()).simultaneousGesture(TapGesture().onEnded{
                    vm.selectedWords = []
                })
                    
//                Button {
//                    vm.selectedWords = []
//                } label: {
//                    Text("Refresha")
//                }
                
                ForEach(vm.savedIdeas) { idea in
                    Text("\(idea.body)")
                }
            }
        }
//        .onAppear {
//            vm.selectedWords = []
//        }
        
        
    }
}

struct PhaseZeroMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseZeroMainView()
    }
}

