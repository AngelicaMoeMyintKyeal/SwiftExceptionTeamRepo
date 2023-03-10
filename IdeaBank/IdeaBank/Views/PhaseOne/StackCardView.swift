//
//  StackCardView.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.

import SwiftUI

struct StackCardView: View {
    @EnvironmentObject var VM: ViewModel
    var word: Word
    
    // Gesture properties
    @State private var offset: CGFloat = 0
    @GestureState var isDragging: Bool = false
    @State private var endSwipe: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let index = CGFloat(VM.getIndex(word: word))
            
            // Show the next two cards above like a stack
            let topOffset = (index <= 2 ? index : 2) * 15
            
            ZStack {
                Card(word: word.word)
                    .frame(width: size.width - topOffset, height: (size.height / 1.5 ))
                    .cornerRadius(15)
                    .offset(y: -topOffset)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
        }
        .offset(x: offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        .gesture(
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    let translation = value.translation.width
                    offset = (isDragging ? translation : .zero)
                })
                .onEnded({ value in
                    let width = getRect().width - 50
                    let translation = value.translation.width
                    
                    let checkingStatus = (translation > 0 ? translation : -translation)
   
                    withAnimation {
                        if checkingStatus > (width / 2) {
                            // Remove card
                            offset = (translation > 0 ? width : -width) * 2
                            endSwipeActions()
                            
                            if translation > 0 {
                                rightSwipe()
                            } else {
                                leftSwipe()
                            }
                            
                        } else {
                            // Reset
                            offset = .zero
                        }
                    }
                })
        )
    }
    
    // Rotation
    func getRotation(angle: Double) -> Double {
        let rotation = (offset / (getRect().width - 50)) * angle
        return rotation
    }
    
    func endSwipeActions() {
        withAnimation(.none) {
            endSwipe = true
        }
        // After the card is swiped away, remove the card from the array to preserve memory
        
        // Delay time is based on the animation time
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = VM.displayingWords.first {
                let _ = withAnimation {
                    VM.displayingWords.removeFirst()
                }
            }
        }
    }
    
    func leftSwipe() {
        // Do stuff
        print("Swiped left")
        VM.addToDisplayingWords()
    }
    
    func rightSwipe() {
        // Do stuff
        if VM.selectedWords.count < 10 {
            VM.selectedWords.append(word)
        } else {
            // What to do when you hit 10 words
        }
        print("Swiped right")
        VM.addToDisplayingWords()
    }
}

// Extending View to get bounds
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct StackCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            StackCardView(
                word: Word(
                    word: "Apple",
                    definition: "An expensive computer"
                )
            )
            .environmentObject(ViewModel.preview)
        }
    }
}
