//
//  YClassMaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YMale: View {
    @EnvironmentObject var cabin: Cabin
    var boundTo: Binding<Pax>
    var forZone: Pax

    var body: some View {

        Group {
            TextField("0 x \(PaxWeight.yMale.weight) kg", text: boundTo.maleStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                forZone.updateMaleLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if forZone.hasMalesInZone {
                Text("\(forZone.yMaleWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }
        }
    }
}


