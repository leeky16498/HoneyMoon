//
//  GuideComponent.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 29/04/2022.
//

import SwiftUI

struct GuideComponent: View {
    
    var title : String
    var subtitle : String
    var description : String
    var icon : String
    
    var body: some View {
        HStack(alignment : .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            VStack(alignment : .leading) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                Divider().padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                //이거를 사용하게 되면 
                
            }
        }
    }
}

//struct GuideComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        GuideComponent()
//    }
//}
