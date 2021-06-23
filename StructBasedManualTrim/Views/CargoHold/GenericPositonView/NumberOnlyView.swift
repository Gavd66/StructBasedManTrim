//
//  NumberOnlyView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct NumberOnlyView: View {

   
    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.hasCargoInNumberOnly {
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
                        .animation()
                        .onChange(mainHoldInstance.updateCargoLabel))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if mainHoldInstance.hasCargoInNumberOnly {
                Text("kg")
                    .loadedStyle()
            }
        }
    }
}


