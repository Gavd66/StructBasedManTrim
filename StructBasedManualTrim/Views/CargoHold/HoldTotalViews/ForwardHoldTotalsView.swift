//
//  ForwardHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

// Maybe alert generated here with a binding to pass to the main view ?
struct ForwardHoldTotalsView: View {

    @EnvironmentObject var cargoHold: CargoHold
    var body: some View {
        VStack {
            HStack {
                Spacer()
            Text("Compartment 1")
                .italic()
                .bold()
                 Spacer()
            }
            HStack {
        VStack(alignment: .center, spacing: 5) {
            Text("Bags")
            Text("\(cargoHold.compartment1TotalBagWeight) kg")
                .capsuleStyle()
        }

        VStack(alignment: .center, spacing: 5) {
            Text("Cargo")
            Text("\(cargoHold.compartment1TotalCargoWeight) kg")
                .capsuleStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Total")
            Text("\(cargoHold.compartment1TotalWeight) kg")
                .capsuleStyle()
                
        }
    }
        }
        VStack {
            HStack {
                Spacer()
                Text("Compartment 2")
                    .italic()
                    .bold()
                Spacer()
            }
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    Text("Bags")
                    Text("\(cargoHold.compartment2TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargoHold.compartment2TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargoHold.compartment2TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text("Forward Hold Total")
                    .italic()
                    .bold()
                Text("\(cargoHold.forwardHoldTotalWeight) kg")
                    .capsuleStyle()                
            }
            Spacer()
        }
        
    } 
}

