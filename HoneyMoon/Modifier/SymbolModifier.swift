//
//  SymbolModifier.swift
//  HoneyMoon
//
//  Created by Kyungyun Lee on 30/04/2022.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content : Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: .gray, radius: 12, x: 0, y: 0)
    }
}
