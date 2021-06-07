//
//  BulkView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 3/6/21.
//

import SwiftUI

struct BulkView: View {

    @EnvironmentObject var underFloor: UnderFloor
    var position = "Bulk"
    var body: some View {
        Group {
            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.bulkHold.hasItemsLoaded {
                        Text("\(position) Item Numbers:")
                            .loadedStyle()
                    } else {
                        Text("\(position)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 Items", text: $underFloor.bulkHold.itemStringCount
                            .animation()
                            .onChange(underFloor.bulkHold.updateItemLabels))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if underFloor.bulkHold.hasItemsLoaded {
                    Text("\(underFloor.bulkHold.itemWeight) kg")
                        .loadedStyle()
                } else {
                    Text("No Items")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))

            HStack {
                Button(action: hideKeyboard) {
                    if underFloor.bulkHold.hasCargoLoaded {
                        Text("\(position) Cargo")
                            .loadedStyle()
                    } else {
                        Text("\(position)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 kg", text: $underFloor.bulkHold.cargoStringWeight
                            .animation()
                            .onChange(underFloor.bulkHold.updateCargoLabels))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if underFloor.bulkHold.hasCargoLoaded {
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

