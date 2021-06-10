//
//  BulkHoldTotalsView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 7/6/21.
//

import SwiftUI

struct BulkHoldTotalView: View {
    @EnvironmentObject var cargoHold: CargoHold

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Compartment 5")
                    .italic()
                    .bold()
                Spacer()
            }
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    Text("Items")
                    Text("\(cargoHold.bulkHold.itemWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(cargoHold.bulkHold.cargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(cargoHold.compartment5TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }
        .contextMenu {
            Text("Bulk Hold limit \(Underfloor.compartment5.limitWeight) kg")
        }
    }
}


