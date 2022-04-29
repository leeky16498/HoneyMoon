//
//  HeaderView.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuideView : Bool
    
    var body: some View {
        HStack {
            Button(action: {
                showGuideView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            })
            .accentColor(.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height : 28)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            })
            .accentColor(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView()
//    }
//}
