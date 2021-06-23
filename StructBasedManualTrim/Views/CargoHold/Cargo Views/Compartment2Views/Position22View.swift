//
//  Position22View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position22View: View {


    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 22, bindingCargoPosition: $cargo.position22, cargoPosition: cargo.position22)
    }
}
