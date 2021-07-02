//
//  NumberPapaView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoPapaView: View {

    var position: Int
    var bindingCargoPosition: Binding<UnderFloor>
    var cargoPosition: UnderFloor

    var body: some View {

        HStack {
            Button(action: hideKeyboard) {
                if cargoPosition.cargoPapaWeight != 0 {
                    Text("\(position)P Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position)P Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()
            TextField("0 kg",
                      text: bindingCargoPosition.cargoPapaStringWeight
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if cargoPosition.cargoPapaWeight != 0 {
                Text("kg")
                    .loadedStyle()
            }
        }
    }
}

   
