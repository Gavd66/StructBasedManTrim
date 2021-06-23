//
//  Position24View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position24View: View {


    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 24, bindingCargoPosition: $cargo.position24, cargoPosition: cargo.position24)
    }
}

