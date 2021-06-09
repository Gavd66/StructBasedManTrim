//
//  AftHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

struct AftHoldTotalsView: View {

    @EnvironmentObject var cargoHold: CargoHold
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Compartment 3")
                    .italic()
                    .bold()
                Spacer()
            }
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    Text("Bags")
                    Text("\(cargoHold.compartment3TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargoHold.compartment3TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargoHold.compartment3TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }//
        VStack {
            HStack {
                Spacer()
                Text("Compartment 4")
                    .italic()
                    .bold()
                Spacer()
            }
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    Text("Bags")
                    Text("\(cargoHold.compartment4TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargoHold.compartment4TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargoHold.compartment4TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text("Aft Hold Total")
                    .italic()
                    .bold()
                Text("\(cargoHold.aftHoldTotalWeight) kg")
                    .capsuleStyle()
            }
            Spacer()
        }
    }
}
