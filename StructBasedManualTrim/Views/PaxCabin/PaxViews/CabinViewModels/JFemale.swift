//
//  JClassFemaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JFemale: View {

    @EnvironmentObject  var cabin: Cabin
   
    var boundTo: Binding<Pax>
    var forZone: Pax
    var zoneTotal: Seats

    var body: some View {

        Group {
            TextField("0 x \(PaxWeight.jFemale.weight) kg", text: boundTo.femaleStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                forZone.updateFemaleLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if forZone.hasFemalesInZone {
                Text("\(forZone.jFemaleWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }
        }
    }
}

