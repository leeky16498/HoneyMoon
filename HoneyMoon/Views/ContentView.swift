//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showBookingAlert : Bool = false
    @State private var showGuideView : Bool = false
    @State private var showInfo : Bool = false
    @GestureState private var dragState = DragState.inactive
    @State private var lastCardIndex : Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    private let dragAreaThreshold : CGFloat = 65.0
    
    enum DragState {
        case inactive, pressing, dragging(translation : CGSize)
        
        var translation : CGSize {
            switch self {
            case .inactive:
                return .zero
            case .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging : Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return false
            case .dragging:
                return true
            }
        }
        
        var isPressing : Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return true
            case .dragging:
                return true
            }
        }
    }
    
    @State var cardViews : [CardView] = {
        var views = [CardView]()
        for honeymoon in honeyMoonData {
            views.append(CardView(honeymoon: honeymoon))
        }
        return views
    }()
    //move cards
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeymoon = honeyMoonData[lastCardIndex % honeyMoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    //카드를 위로 올려준다.
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuideView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            //카드 뷰
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView : cardView) ? dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(.degrees(self.isTopCard(cardView: cardView) ? (dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                               self.moveCards()
                           
                                }
                                })
                        )
                        .transition(self.cardRemovalTransition)
                }
            }
            .padding()
            
            Spacer()
            //푸터 뷰
            FooterView(showBookingAlert: $showBookingAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented : $showBookingAlert) {
            Alert(title: Text("Success"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple"), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
    
    private func isTopCard(cardView : CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    } // 카드가 위로 올라온 카드인지 확인하다.
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
