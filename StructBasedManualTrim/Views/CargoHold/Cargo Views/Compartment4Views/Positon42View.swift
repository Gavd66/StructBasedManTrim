//
//  Positon42View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position42View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 42, bindingCargoPosition: $cargo.position42, cargoPosition: cargo.position42)
    }
}
