//
//  JClassLogicView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct JClassMaleView: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        if cabin.configuration == .standard {

            TextField("0 x \(PaxWeight.jMale.weight) kg", text: $cabin.zone1.maleStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                cabin.zone1.updateMaleLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if cabin.zone1.hasMalesInZone {
                Text("\(cabin.zone1.jMaleWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }


        } else {

            if cabin.configuration == .domestic {
                TextField("0 x \(PaxWeight.yMale.weight) kg", text: $cabin.zone1.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone1.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                if cabin.zone1.hasMalesInZone {
                    Text("\(cabin.zone1.yMaleWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }

            }

        }
    }
}

struct JClassLogicView_Previews: PreviewProvider {
    static var previews: some View {
        JClassMaleView()
    }
}
