//
//  CardView.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    var honeymoon : Destination
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(24)
            .frame(maxWidth : .infinity)
            .overlay(
                VStack(spacing : 12) {
                    Text(honeymoon.place.uppercased())
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(height : 1)
                            ,alignment: .bottom
                        )
                    Text(honeymoon.country.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth : 85)
                        .padding(.horizontal, 10)
                        .padding(. vertical, 5)
                        .background(
                            Capsule()
                                .fill(.white)
                        )
                }
                    .frame(minWidth  : 280)
                    .padding(.bottom, 50)
                ,alignment: .bottom
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(honeymoon: honeyMoonData[1])
    }
}
