//
//  Positon41View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position41View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 41, bindingCargoPosition: $cargo.position41, cargoPosition: cargo.position41)
    }
}

