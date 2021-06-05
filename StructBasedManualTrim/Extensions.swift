//
//  Extensions.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import Foundation
import SwiftUI
// TwoStraws generic binding to monitor changes to any bindings
extension Binding {
    func onChange(_ handler: @escaping(Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

extension View {
    func nilFitStyle() -> some View {
        self.modifier(NilFit())
    }
}

extension View {
    func zeroBagsStyle() -> some View {
        self.modifier(ZeroBags())
    }
}

extension View {
    func bagsLoadedStyle() -> some View {
        self.modifier(BagsLoaded())
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

