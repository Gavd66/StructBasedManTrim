//
//  TankViewModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 19/6/21.
//

import SwiftUI

struct TankViewModel: View {
   
    var whichTankHasFuel: Bool
    var tankLabelwithFuel: String
    var tankLabelwithoutFuel: String
    var tankValue: Binding<String>

    var body: some View {

        HStack {
            Button(action: hideKeyboard) {
                if whichTankHasFuel {
                    Text(tankLabelwithFuel)
                        .loadedStyle()

                } else {
                    Text(tankLabelwithoutFuel)
                        .emptyStyle()
                }
            }
            .capsuleStyle()
            .layoutPriority(2)
            TextField("Tonnes kg", text: tankValue
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)

            if whichTankHasFuel {
                Text("Tonnes")
                    .loadedStyle()
            } else {
                Text(FuelLoaded.none.rawValue)
                    .emptyStyle()
            }
        }
        .font(.system(size: 18))
    }
}

