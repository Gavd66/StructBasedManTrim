//
//  ForwardHoldView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 6/6/21.
//

import SwiftUI

// Maybe alert generated here with a binding to pass to the main view ?
struct ForwardHoldTotalsView: View {

    @EnvironmentObject var cargo: CargoHold
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
            Text("\(cargo.compartment1TotalBagWeight) kg")
                .capsuleStyle()
        }

        VStack(alignment: .center, spacing: 5) {
            Text("Cargo")
            Text("\(cargo.compartment1TotalCargoWeight) kg")
                .capsuleStyle()
        }
        VStack(alignment: .center, spacing: 5) {
            Text("Total")
            Text("\(cargo.compartment1TotalWeight) kg")
                .capsuleStyle()
                
        }
    }
        }
        .contextMenu {
            Text("Compartment 1 Limit \(WeightLimit.compartment1.maxWeight) kg")
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
                    Text("\(cargo.compartment2TotalBagWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargo.compartment2TotalCargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargo.compartment2TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }//
        .contextMenu {
            Text("Compartment 2 limit \(WeightLimit.compartment2.maxWeight) kg")
        }
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text("Forward Hold Total")
                    .italic()
                    .bold()
                Text("\(cargo.forwardHoldTotalWeight) kg")
                    .capsuleStyle()                
            }
            Spacer()
        }
        .contextMenu {
            Text("FWD Hold limit \(WeightLimit.forwardHold.maxWeight) kg")
        }
        
    } 
}

