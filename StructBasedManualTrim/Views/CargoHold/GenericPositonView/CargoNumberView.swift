//
//  NumberOnlyView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoNumberView: View {

   
    var position: Int
    var bindingMainHoldInstance: Binding<UnderFloor>
    var mainHoldInstance: UnderFloor

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.cargoWeight != 0 {
                    Text("\(position) Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position) Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()
            TextField("0 kg",
                      text: bindingMainHoldInstance.cargoStringWeight
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if mainHoldInstance.cargoWeight != 0 {
                Text("kg")
                    .loadedStyle()
            }
        }
    }
}


