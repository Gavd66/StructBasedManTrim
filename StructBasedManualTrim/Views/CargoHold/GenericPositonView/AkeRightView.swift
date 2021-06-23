//
//  AkeRightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct AkeRightView: View {

    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.hasBagsInRight {
                    Text("\(position)R Bags")
                        .loadedStyle()
                        .capsuleStyle()
                } else {
                    Text("\(position)R ")
                        .emptyStyle()
                        .capsuleStyle()
                }
            }

            TextField("0 Bags", text: bindingMainHoldInstance.bagCountRight
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                mainHoldInstance.updateRightLabels
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if mainHoldInstance.hasBagsInRight {
                Text("\(mainHoldInstance.bagWeightRight) kg")
                    .loadedStyle()
            } else {
                Text("AKE: 71kg ")
                    .loadedStyle()
            }
        }
        .font(.system(size: 18))
    }
}



