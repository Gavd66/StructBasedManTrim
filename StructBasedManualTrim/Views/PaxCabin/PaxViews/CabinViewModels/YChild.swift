//
//  YClassChildModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YChild: View {

    @EnvironmentObject  var cabin: Cabin

    var boundTo: Binding<Pax>
    var forZone: Pax
    var zoneTotal: Seats

    var body: some View {

        Group {
            TextField("0 x \(PaxWeight.yChild.weight) kg", text: boundTo.childrenStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                forZone.updateChildLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if forZone.hasChildrenInZone {
                Text("\(forZone.yChildWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }
        }
    }
}

