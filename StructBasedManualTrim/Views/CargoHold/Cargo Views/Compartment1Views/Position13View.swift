//
//  Position13View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position13View: View {
    @EnvironmentObject var cargo: CargoHold

    var body: some View {
        PositionView(position: 13, bindingCargoPosition: $cargo.position13, cargoPosition: cargo.position13)
    }
}

