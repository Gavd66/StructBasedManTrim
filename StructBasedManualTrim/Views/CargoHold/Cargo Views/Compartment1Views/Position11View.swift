//
//  Position11View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI


struct Position11View: View {

    @EnvironmentObject var cargo: CargoHold

    var body: some View {
        PositionView(position: 11, bindingCargoPosition: $cargo.position11, cargoPosition: cargo.position11)
    }
}

