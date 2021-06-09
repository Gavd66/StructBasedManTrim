//
//  BulkView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct BulkView: View {

    @EnvironmentObject var cargoHold: CargoHold
    var position = "Bulk"
    var body: some View {
        Group {
            HStack {
                Button(action: hideKeyboard) {
                    if cargoHold.bulkHold.hasItemsLoaded {
                        Text("\(position) Items:")
                            .loadedStyle()
                    } else {
                        Text("\(position)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 Items", text: $cargoHold.bulkHold.itemStringCount
                            .animation()
                            .onChange(cargoHold.bulkHold.updateItemLabels))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cargoHold.bulkHold.hasItemsLoaded {
                    Text("\(cargoHold.bulkHold.itemWeight) kg")
                        .loadedStyle()
                } else {
                    Text("No Items")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))

            HStack {
                Button(action: hideKeyboard) {
                    if cargoHold.bulkHold.hasCargoLoaded {
                        Text("\(position) Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg", text: $cargoHold.bulkHold.cargoStringWeight
                            .animation()
                            .onChange(cargoHold.bulkHold.updateCargoLabels))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cargoHold.bulkHold.hasCargoLoaded {
                    Text("kg")
                        .loadedStyle()
                } else {
                    Text("No Cargo")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
        }
    }
}

