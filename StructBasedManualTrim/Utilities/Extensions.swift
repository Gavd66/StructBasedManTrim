//
//  Extensions.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import Foundation
import SwiftUI
import Combine
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
    func emptyStyle() -> some View {
        self.modifier(Empty())
    }
}

extension View {
    func loadedStyle() -> some View {
        self.modifier(Loaded())
    }
}

extension View {
    func capsuleStyle() -> some View {
        self.modifier(Capsule())
    }
}

extension View {
    func pobStyle() -> some View {
        self.modifier(POB())
    }
}

extension View {
    func weightCapsule() -> some View {
        self.modifier(POB())
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
