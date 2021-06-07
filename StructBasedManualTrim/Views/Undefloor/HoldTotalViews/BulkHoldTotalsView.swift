//
//  BulkHoldTotalsView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 7/6/21.
//

import SwiftUI

struct BulkHoldTotalView: View {
    @EnvironmentObject var underFloor: UnderFloor

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
                    Text("\(underFloor.bulkHold.itemWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Cargo")
                    Text("\(underFloor.bulkHold.cargoWeight) kg")
                        .capsuleStyle()
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Total")
                    Text("\(underFloor.compartment5TotalWeight) kg")
                        .capsuleStyle()
                }
            }
        }
    }
}


