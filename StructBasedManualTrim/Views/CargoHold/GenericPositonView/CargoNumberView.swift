//
//  NumberOnlyView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoNumberView: View {

   
    var position: Int
    var bindingCargoPosition: Binding<UnderFloor>
    var cargoPosition: UnderFloor

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if cargoPosition.cargoWeight != 0 {
                    Text("\(position) Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position) Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()
            TextField("0 kg",
                      text: bindingCargoPosition.cargoStringWeight
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if cargoPosition.cargoWeight != 0 {
                Text("kg")
                    .loadedStyle()
            }
        }
    }
}


