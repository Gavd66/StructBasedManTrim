//
//  Position43View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position43View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 43, bindingCargoPosition: $cargo.position43, cargoPosition: cargo.position43)
    }
}

