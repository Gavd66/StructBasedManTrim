//
//  Position33View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position33View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 33, bindingCargoPosition: $cargo.position33, cargoPosition: cargo.position33)
    }
}
