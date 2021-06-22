//
//  CargoView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct CargoView: View {

    @EnvironmentObject var cargoHold: CargoHold
    var body: some View {
        VStack(spacing: 15) {
            if cargoHold.compartment1TotalWeight != 0 {
                WeightIndexFormatView(
                    title: "Compartment 1",
                    weightType: cargoHold.compartment1TotalWeight,
                    indexUnit: cargoHold.compartment1IndexUnit)
            }
            if cargoHold.compartment2TotalWeight != 0 {
                WeightIndexFormatView(
                    title: "Compartment 2",
                    weightType: cargoHold.compartment2TotalWeight,
                    indexUnit: cargoHold.compartment2IndexUnit)
            }
            if cargoHold.compartment3TotalWeight != 0 {
                WeightIndexFormatView(
                    title: "Compartment 3",
                    weightType: cargoHold.compartment3TotalWeight,
                    indexUnit: cargoHold.compartment3IndexUnit)
            }
            if cargoHold.compartment4TotalWeight != 0 {
                WeightIndexFormatView(
                    title: "Compartment 4",
                    weightType: cargoHold.compartment4TotalWeight,
                    indexUnit: cargoHold.compartment4IndexUnit)
            }
            if cargoHold.compartment5TotalWeight != 0 {
                WeightIndexFormatView(
                    title: "Compartment 5",
                    weightType: cargoHold.compartment5TotalWeight,
                    indexUnit: cargoHold.compartment5IndexUnit)
            }

            if cargoHold.compartment1TotalWeight == 0
                && cargoHold.compartment2TotalWeight == 0
                && cargoHold.compartment3TotalWeight == 0
                && cargoHold.compartment4TotalWeight == 0
                && cargoHold.compartment5TotalWeight == 0 {
                HStack {
                    Spacer()
                Text("Empty")
                    Spacer()
                }
                .nilFitStyle()

            }
        }
    }
}

struct CargoView_Previews: PreviewProvider {
    static var previews: some View {
        CargoView()
    }
}
