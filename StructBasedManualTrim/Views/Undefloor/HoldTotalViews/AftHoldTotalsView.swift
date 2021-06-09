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
                    Text("\(underFloor.compartment3TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(underFloor.compartment3TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(underFloor.compartment3TotalWeight) kg")
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
                    Text("\(underFloor.compartment4TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(underFloor.compartment4TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(underFloor.compartment4TotalWeight) kg")
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
                Text("\(underFloor.aftHoldTotalWeight) kg")
                    .capsuleStyle()
            }
            Spacer()
        }
    }
}
