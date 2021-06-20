//
//  FuelBurnView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 19/6/21.
//

import SwiftUI

struct FuelBurnView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        Group {
        HStack {
            Button(action: hideKeyboard) {
                if aircraft.fuelBurnEntered {
                    Text("Fuel Burn")
                        .loadedStyle()
                } else {
                    Text("Fuel Burn:")
                        .emptyStyle()
                }
            }
            .capsuleStyle()

            TextField("Fuel Burn kg", text: $aircraft.fuelBurnStringNumber
                        .animation())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if aircraft.fuelBurnEntered {
                Text("KG")
                    .loadedStyle()
            } else {
                Text(FuelLoaded.none.rawValue)
                    .emptyStyle()
            }

        }
        .font(.system(size: 18))

            HStack(spacing: 5) {
                if aircraft.fuelBurnEntered {
                    HStack {
                        Spacer()
                        Text("Fuel Burn")
                        Text("\(aircraft.fuelBurn)")
                        Text("KG")
                        Spacer()
                    }
                    .loadedStyle()
                    .capsuleStyle()
                } else {
                    HStack {
                        Spacer()
                        Text("No Fuel Burn ")
                            .nilFitStyle()
                        Spacer()
                    }
                }
            }
            .font(.system(size: 18))
        }
    }
}

struct FuelBurnView_Previews: PreviewProvider {
    static var previews: some View {
        FuelBurnView()
    }
}
