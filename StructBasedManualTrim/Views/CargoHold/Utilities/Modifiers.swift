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
            .font(.system(size: 18))
            .padding([.leading, .trailing], 90)
            .padding([.top,.bottom], 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
                    .shadow(radius: 8)

            )

            .layoutPriority(1)
            .transition(.scale)
    }
}

struct Empty: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.primary)
            .layoutPriority(1)
            .transition(.scale)
    }
}

struct Loaded: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
           // .layoutPriority(1)
            .transition(.scale)
    }
}

struct Capsule: ViewModifier {
    func body(content: Content) -> some View {
        content
            .layoutPriority(1)
            .font(.system(size: 18))
            .padding([.leading, .trailing], 10)
            .padding([.top,.bottom], 5)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
                    .shadow(radius: 3)

            )

            .foregroundColor(.accentColor)

            .padding(.bottom, 3)
            .transition(.scale)
    }
}
