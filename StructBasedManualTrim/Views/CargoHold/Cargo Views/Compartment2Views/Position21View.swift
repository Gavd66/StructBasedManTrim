//
//  Position21View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position21View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 21, bindingCargoPosition: $cargo.position21, cargoPosition: cargo.position21)
    }
}
