//
//  GuideView.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct GuideView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment : .center, spacing: 20) {
                HeaderComponent()
                
                Spacer()
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment : .leading, spacing : 25) {
                    GuideComponent(title: "Like", subtitle: "Swipe right", description: "Do you like this destination? Touch the screen and swip right. It will be saved to the favorites", icon: "heart.circle")
                    
                    GuideComponent(title: "Like", subtitle: "Swipe right", description: "Do you like this destination? Touch the screen and swip right. It will be saved to the favorites", icon: "heart.circle")
                    
                    GuideComponent(title: "Like", subtitle: "Swipe right", description: "Do you like this destination? Touch the screen and swip right. It will be saved to the favorites", icon: "heart.circle")
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth : 0, maxWidth : .infinity)
                        .background(
                            Capsule()
                                .fill(.pink)
                        )
                        .foregroundColor(.white)
                })
            }
            .frame(minWidth : 0, maxWidth: .infinity)
            .padding()
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
