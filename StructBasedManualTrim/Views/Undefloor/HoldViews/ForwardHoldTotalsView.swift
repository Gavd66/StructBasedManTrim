//
//  ForwardHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

struct ForwardHoldTotalsView: View {

    @EnvironmentObject var underFloor: UnderFloor
    var body: some View {
        VStack {
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 1 Total Bag wt")
            Text("\(underFloor.compartment1TotalBagWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 1 Total Cargo wt")
            Text("\(underFloor.compartment1TotalCargoWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 1 Total wt")
            Text("\(underFloor.compartment1TotalWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 2 Total Bag wt")
            Text("\(underFloor.compartment2TotalBagWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 2 Total Cargo wt")
            Text("\(underFloor.compartment2TotalCargoWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Compartment 2 Total wt")
            Text("\(underFloor.compartment2TotalWeight) kg")
                .weightStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Forward Hold Total wt")
            Text("\(underFloor.forwardHoldTotalWeight) kg")
                .weightStyle()
        }
        }
        .multilineTextAlignment(.leading)
    }
}

