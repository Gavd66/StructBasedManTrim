//
//  CargoRightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoRightView: View {
    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.hasCargoInRight {
                    Text("\(position)R Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position)R Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()

            TextField("0 kg" , text: bindingMainHoldInstance.cargoRight
                        .animation()
                        .onChange(
                            withAnimation(.easeInOut) {
                                mainHoldInstance.updateCargoRightLabels
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad).onAppear()

            if mainHoldInstance.hasCargoInLeft {
                Text("kg")
                    .loadedStyle()
            }
        }
        .font(.system(size: 18))
    }
}
