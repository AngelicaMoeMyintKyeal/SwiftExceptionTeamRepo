//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

/*
This view is not needed anymore but I'm keeping
it for learning purpouses
 
import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc: NSManagedObjectContext
    @EnvironmentObject var VM: ViewModel
    
    @State private var isShowingPhaseTwo: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                if VM.selectedWords.count < 10 {
                    PhaseOneMainView()
                } else {
                    PhaseTwoMainView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
*/
