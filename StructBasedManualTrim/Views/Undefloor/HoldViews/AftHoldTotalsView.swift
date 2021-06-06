//
//  AftHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

struct AftHoldTotalsView: View {
    @EnvironmentObject var underFloor: UnderFloor
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 3 Total Bag wt")
                Text("\(underFloor.compartment3TotalBagWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 3 Total Cargo wt")
                Text("\(underFloor.compartment3TotalCargoWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 3 Total wt")
                Text("\(underFloor.compartment3TotalWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 4 Total Bag wt")
                Text("\(underFloor.compartment4TotalBagWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 4 Total Cargo wt")
                Text("\(underFloor.compartment4TotalCargoWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Compartment 4 Total wt")
                Text("\(underFloor.compartment2TotalWeight) kg")
                    .capsuleStyle()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Aft Hold Total wt")
                Text("\(underFloor.aftHoldTotal) kg")
                    .capsuleStyle()
            }
        }
        .multilineTextAlignment(.leading)
    }
}
