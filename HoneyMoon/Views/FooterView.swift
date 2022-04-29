//
//  FooterView.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct FooterView: View {
    
    @Binding var showBookingAlert : Bool
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                showBookingAlert.toggle()
            }, label: {
                Text("Book Destination")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .accentColor(.pink)
                    .background(
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    )
            })
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

//struct FooterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FooterView()
//    }
//}
