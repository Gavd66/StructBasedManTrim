//
//  Position12View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position12View: View {
    @EnvironmentObject var cargo: CargoHold

    var body: some View {
        PositionView(position: 12, bindingCargoPosition: $cargo.position12, cargoPosition: cargo.position12)
    }
}

