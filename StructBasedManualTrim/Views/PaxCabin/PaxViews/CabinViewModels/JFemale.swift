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
    var zone: Pax


    var body: some View {

        HStack {
            Button(action: hideKeyboard) {
                if zone.hasFemalesInZone {
                    Text("\(HasFemales.some.rawValue)")
                        .loadedStyle()
                        .capsuleStyle()
                } else {
                    Text("\(HasFemales.none.rawValue)")
                        .emptyStyle()
                        .capsuleStyle()
                }
            }
            TextField("0 x \(PaxWeight.jFemale.weight) kg", text: boundTo.femaleStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                zone.updateFemaleLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            if zone.hasFemalesInZone {
                Text("\(zone.jFemaleWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }
        }
        .font(.system(size: 18))
    }
}

