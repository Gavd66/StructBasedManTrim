//
//  Position69View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct Position69View: View {

    @EnvironmentObject var cargo: CargoHold
    var body: some View {
        PositionView(position: 11, bindingCargoPosition: $cargo.position11, cargoPosition: cargo.position11)
    }
}

struct Position69View_Previews: PreviewProvider {
    static var previews: some View {
        Position69View()
    }
}
