//
//  AftHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

struct AftHoldTotalsView: View {

    @EnvironmentObject var cargo: CargoHold
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
                    Text("\(cargo.compartment3TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargo.compartment3TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargo.compartment3TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }//
        .contextMenu {
            Text("Compartment 3 Limit \(WeightLimit.compartment3.maxWeight) kg")
        }
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
                    Text("\(cargo.compartment4TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargo.compartment4TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargo.compartment4TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }
        .contextMenu{
            Text("Compartment 4 limit \(WeightLimit.compartment4.maxWeight) kg")
        }
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text("Aft Hold Total")
                    .italic()
                    .bold()
                Text("\(cargo.aftHoldTotalWeight) kg")
                    .capsuleStyle()
            }
            Spacer()
        }
        .contextMenu {
            Text("Aft Hold limit \(WeightLimit.aftHold.maxWeight) kg")
        }
    }
}
