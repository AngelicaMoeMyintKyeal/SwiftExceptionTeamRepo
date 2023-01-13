//
//  PhaseInformView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 12/01/23.
//

import SwiftUI

struct PhaseInformView: View {
    
    var phaseHeader: String
    var phaseTitle: String
    var phaseDescription: String
    
    var body: some View {
        VStack {
            Text(phaseHeader.uppercased())
                .foregroundColor(.secondary)
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .fontWeight(.black)
                
            
            Text(phaseTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            Text(phaseDescription)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 32.0)
        
    }
}

struct PhaseInformView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseInformView(phaseHeader: "phase 1", phaseTitle: "Choose", phaseDescription: "Swipe right to save a word if you like it or it inspires you, swipe right to discard it")
    }
}

