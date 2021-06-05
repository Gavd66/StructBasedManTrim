//
//  Modifiers.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 5/6/21.
//

import Foundation
import SwiftUI

struct NilFit: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], 18)
            .padding([.top,.bottom], 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)

            )
            .shadow(radius: 4)
            .layoutPriority(1)
            .transition(.scale)
    }
}

struct ZeroBags: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 2)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.gray, lineWidth: 2)

            )
            .shadow(radius: 4)
            .layoutPriority(1)
            .transition(.scale)
    }
}

struct BagsLoaded: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 2)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.accentColor, lineWidth: 2)

            )
            .shadow(radius: 4)
            .layoutPriority(1)
            .transition(.scale)
    }
}

