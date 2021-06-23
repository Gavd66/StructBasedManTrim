//
//  Position31View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position31View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 31, bindingCargoPosition: $cargo.position31, cargoPosition: cargo.position31)
    }
}

