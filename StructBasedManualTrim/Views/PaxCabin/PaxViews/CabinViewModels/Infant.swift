//
//  InfantModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct Infant: View {

    @EnvironmentObject  var cabin: Cabin

    var boundTo: Binding<Pax>
    var forZone: Pax
    var zoneTotal: Seats

    var body: some View {
        HStack {
            Button(action: hideKeyboard) {
                if forZone.hasInfantsInZone {
                    Text("\(HasInfants.some.rawValue)")
                        .loadedStyle()
                        .capsuleStyle()
                } else {
                    Text("\(HasInfants.none.rawValue)")
                        .emptyStyle()
                        .capsuleStyle()
                }
            }

            TextField("0 x \(PaxWeight.infant.weight)", text:
                        boundTo.infantStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                forZone.updateInfantLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if forZone.hasInfantsInZone {
                Text("\(forZone.infantWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }
        }
        .font(.system(size: 18))
    }
}

