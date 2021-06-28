//
//  AkeRightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 23/6/21.
//

import SwiftUI

struct AkeRightView: View {

    var position: Int
    var bindingMainHoldInstance: Binding<UnderFloor>
    var mainHoldInstance: UnderFloor

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if mainHoldInstance.bagWeightRight != 0 {
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
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if mainHoldInstance.bagWeightRight != 0 {
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



