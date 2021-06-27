//
//  JClassMaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JMale: View {

    var boundTo: Binding<Pax>
    var zone: Pax

    var body: some View {
            HStack {
                Button(action: hideKeyboard) {
                    if zone.males != 0 {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()

                TextField("0 x \(PaxWeight.jMale.weight) kg", text: boundTo.maleStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

//                if zone.hasMalesInZone {
                if zone.males != 0 {
                    Text("\(zone.jMaleWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
    }
}

