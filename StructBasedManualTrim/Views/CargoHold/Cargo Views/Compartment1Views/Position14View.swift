//
//  Position14View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position14View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 14, bindingCargoPosition: $cargo.position14, cargoPosition: cargo.position14)
    }
}
