//
//  CargoRightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoRightView: View {
    var position: Int
    var bindingCargoPosition: Binding<UnderFloor>
    var cargoPosition: UnderFloor

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if cargoPosition.cargoWeightRight != 0 {
                    Text("\(position)R Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position)R Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()

            TextField("0 kg" , text: bindingCargoPosition.cargoRight
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad).onAppear()
            if cargoPosition.cargoWeightRight != 0 {
                Text("kg")
                    .loadedStyle()
            }
        }
        .font(.system(size: 18))
    }
}
