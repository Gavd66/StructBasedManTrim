//
//  JClassMaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JMale: View {

    @EnvironmentObject var cabin: Cabin
    var boundTo: Binding<Pax>
    var zone: Pax

    var body: some View {
        withAnimation {

            HStack {
                Button(action: hideKeyboard) {
                    if zone.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.jMale.weight) kg", text: boundTo.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.default) {
                                    zone.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if zone.hasMalesInZone {
                    Text("\(zone.jMaleWeight) kg")
                        .loadedStyle()
                        .animation(.default)
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                        .animation(.default)
                }
            }
            .font(.system(size: 18))
        }        
    }
}

