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
    
    var cardViews : [CardView] = {
        var views = [CardView]()
        for honeymoon in honeyMoonData {
            views.append(CardView(honeymoon: honeymoon))
        }
        return views
    }()
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuideView)
            
            Spacer()
            //카드 뷰
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding()
            
            Spacer()
            //푸터 뷰
            FooterView(showBookingAlert: $showBookingAlert)
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
