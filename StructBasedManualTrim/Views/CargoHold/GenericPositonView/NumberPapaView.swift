//
//  NumberPapaView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct NumberPapaView: View {

    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {

        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.hasCargoInPapa {
                    Text("\(position)P Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position)P Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()
            
            TextField("0 kg",
                      text: bindingMainHoldInstance.cargoPapaStringWeight
                        .animation()
                        .onChange(mainHoldInstance.updateCargoPapaLabel))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if mainHoldInstance.hasCargoInPapa {
                Text("kg")
                    .loadedStyle()
            }
        }
    }
}

   
