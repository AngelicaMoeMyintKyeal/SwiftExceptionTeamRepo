//
//  SwipeCarousel.swift
//  IdeaBank
//
//  Created by シェイミ on 11/01/2023.
//

import SwiftUI

// MARK: Custom View
struct SwipeCarousel<Content: View, ID, Item>: View where Item: RandomAccessCollection, Item.Element: Equatable, Item.Element: Identifiable, ID: Hashable {

    var id: KeyPath<Item.Element, ID>
    var items: Item
    // MARK: Creating a Custom View like ForEach
    var content: (Item.Element, CGSize) -> Content
    var trailingCards: Int = 3

    init(items: Item, id: KeyPath<Item.Element, ID>, trailingCards: Int = 3, @ViewBuilder content: @escaping(Item.Element, CGSize) -> Content) {
        self.id = id
        self.items = items
        self.content = content
        self.trailingCards = trailingCards
    }

    // MARK: View/Gesture properties
    @State var offset: CGFloat = 0
    @State var showRight: Bool = false
    @State private var currentIndex: Int = 0

    var body: some View {
        GeometryReader {
            let size = $0.size

            ZStack {
                // No need to use .reversed()
                // Use ZIndex instead
                ForEach(items) { item in
                    cardView(item: item, size: size)
                    // If user swipes right first, show the last swiped card as an overlay
                        .overlay(content: {
                            let index = indexOf(item: item)
                            if (currentIndex + 1) == index && Array(items).indices.contains(currentIndex - 1) && showRight {
                                cardView(item: Array(items)[currentIndex - 1], size: size)
                                    .transition(.identity)
                            }
                        })
                        .zIndex(zIndexFor(item: item))
                }
            }
            .animation(.easeInOut(duration: 0.25), value: offset == .zero)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        showRight = (value.translation.width > 0)
                        offset = (value.translation.width / size.width) * (size.width / 1.2)
                    })
                    .onEnded({ value in
                        let translation = value.translation.width

                        if translation > 0 {
                            // Swipe Right
                            decreaseIndex(translation: translation)
                        } else {
                            // Swipe Left
                            increaseIndex(translation: translation)
                        }

                        withAnimation(.easeInOut(duration: 0.25)) {
                            offset = .zero
                        }
                    })
            )
        }
    }

    @ViewBuilder
    func cardView(item: Item.Element, size: CGSize) -> some View {
        let index = indexOf(item: item)

        content(item, size)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 5, y: 5)
            .scaleEffect(scaleFor(item: item))
            .offset(x: offsetFor(item: item))
            .rotationEffect(.init(degrees: rotationFor(item: item)), anchor: currentIndex > index ? .topLeading : .topTrailing)
            // MARK: Only add gesture value to the current card
            .offset(x: currentIndex == index ? offset : 0)
            .rotationEffect(.init(degrees: rotationForGesture(index: index)), anchor: .top)
            .scaleEffect(scaleForGesture(index: index))
    }

    // MARK: Swapping cards
    func increaseIndex(translation: CGFloat) {
        if translation < 0 && -translation > 110 && currentIndex < (items.count - 1) {
            withAnimation(.easeInOut(duration: 0.25)) {
                currentIndex += 1
            }
        }
    }

    func decreaseIndex(translation: CGFloat) {
        if translation > 0 && translation > 110 && currentIndex > 0 {
            withAnimation(.easeInOut(duration: 0.25)) {
                currentIndex -= 1
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                showRight = false
            }
        }
    }

    // MARK: Gesture-based rotation and scaling values
    func rotationForGesture(index: Int) -> CGFloat {
        // Change the 30 value here as you see fit
        let progress = (offset / screenSize.width) * 30
        return (currentIndex == index ? progress : 0)
    }

    func scaleForGesture(index: Int) -> CGFloat {
        // To avoid oversizing when it goes to negative
        let progress = 1 - ((offset > 0 ? offset : -offset) / screenSize.width)
        return (currentIndex == index ? (progress > 0.75 ? progress : 0.75) : 1)
    }

    // Since we need to move the swiped card away,
    // subtract the current index from the index in all the Methods below
    // MARK: Applying offsets, scaling and rotation for each card based on index

    // Need to check for negative values
    func offsetFor(item: Item.Element) -> CGFloat {
        let index = indexOf(item: item) - currentIndex
        if index > 0 {
            if index > trailingCards {
                return CGFloat(trailingCards) * 20
            }
            return CGFloat(index) * 20
        }
        if -index > trailingCards {
            return CGFloat(trailingCards) * -20
        }
        return CGFloat(index) * 20
    }

    func scaleFor(item: Item.Element) -> CGFloat {
        let index = indexOf(item: item) - currentIndex
        if index > 0 {
            if index > trailingCards {
                return 1 - (CGFloat(trailingCards) / 20)
            }

            // MARK: Decrease scaling by 0.05 for each card. Change as required
            return 1 - (CGFloat(index) / 20)
        }
        if -index > trailingCards {
            return 1 - (CGFloat(trailingCards) / 20)
        }

        // MARK: Decrease scaling by 0.05 for each card. Change as required
        return 1 + (CGFloat(index) / 20)
    }

    func rotationFor(item: Item.Element) -> CGFloat {
        let index = indexOf(item: item) - currentIndex
        if index > 0 {
            if index > trailingCards {
                return CGFloat(trailingCards) * 3
            }
            // MARK: Rotate by 3 degrees for each card. Change as required
            return CGFloat(index) * 3
        }
        if -index > trailingCards {
            return -CGFloat(trailingCards) * 3
        }
        // MARK: Rotate by 3 degrees for each card. Change as required
        return CGFloat(index) * 3
    }

    // MARK: ZIndex value for each card
    func zIndexFor(item: Item.Element) -> Double {
        let index = indexOf(item: item)
        let totalCount = items.count

        // Placing current index on top of all items
        return currentIndex == index ? 10 : (currentIndex < index ?  Double(totalCount - index) : Double(index - totalCount))
    }

    // MARK: Index for each card
    func indexOf(item: Item.Element) -> Int {
        let arrayItems = Array(items)
        if let index = arrayItems.firstIndex(of: item) {
            return index
        }
        return 0
    }

    // Get iPhone screen size
    var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        return window.screen.bounds.size
    }()
}
