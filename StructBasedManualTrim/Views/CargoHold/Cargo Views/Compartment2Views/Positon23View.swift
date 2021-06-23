//
//  Positon23View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct Position23View: View {


    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 23, bindingCargoPosition: $cargo.position23, cargoPosition: cargo.position23)
    }
}
