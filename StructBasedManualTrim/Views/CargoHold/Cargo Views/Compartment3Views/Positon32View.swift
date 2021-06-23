//
//  Positon32View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position32View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 32, bindingCargoPosition: $cargo.position32, cargoPosition: cargo.position32)
    }
}
