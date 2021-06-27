//
//  akeLeftView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct AkeLeftView: View {

    var position: Int
    var bindingMainHoldInstance: Binding<MainHold>
    var mainHoldInstance: MainHold

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
//                if mainHoldInstance.hasBagsInLeft {
                if mainHoldInstance.bagWeightLeft != 0 {
                    Text("\(position)L Bags")
                        .loadedStyle()
                } else {
                    Text("\(position)L  ")
                        .emptyStyle()
                }
            }
            .capsuleStyle()

            TextField("0 bags", text: bindingMainHoldInstance.bagCountLeft
                        .animation()
//                        .onChange(mainHoldInstance.updateLeftLabels)
            )

                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

//            if mainHoldInstance.hasBagsInLeft {
            if mainHoldInstance.bagWeightLeft != 0 {
                Text("\(mainHoldInstance.bagWeightLeft) kg")
                    .loadedStyle()
            } else {
                Text("AKE: 71kg ")
                    .loadedStyle()
            }
        }
        .font(.system(size: 18))
    }
}



