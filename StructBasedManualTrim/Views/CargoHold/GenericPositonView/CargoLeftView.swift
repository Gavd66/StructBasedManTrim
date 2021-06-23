//
//  CargoLeftView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct CargoLeftView: View {

    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.hasCargoInLeft {
                    Text("\(position)L Cargo")
                        .loadedStyle()
                } else {
                    Text("\(position)L Cargo")
                        .emptyStyle()
                }
            }
            .capsuleStyle()

            TextField("0 kg" , text: bindingMainHoldInstance.cargoLeft
                        .animation()
                        .onChange(
                            withAnimation(.easeInOut) {
                                mainHoldInstance.updateCargoLeftLabels
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

