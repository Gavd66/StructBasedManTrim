//
//  JClassFemaleView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct JClassFemaleView: View {
    @EnvironmentObject var cabin: Cabin

    var body: some View {
        if cabin.configuration == .standard {

            TextField("0 x \(PaxWeight.jFemale.weight) kg", text: $cabin.zone1.femaleStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                cabin.zone1.updateFemaleLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if cabin.zone1.hasFemalesInZone {
                Text("\(cabin.zone1.jFemaleWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }


        } else {

            if cabin.configuration == .domestic {
                TextField("0 x \(PaxWeight.yFemale.weight) kg", text: $cabin.zone1.femaleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone1.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                if cabin.zone1.hasFemalesInZone {
                    Text("\(cabin.zone1.yFemaleWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }

            }

        }
    }
}

struct JClassFemaleView_Previews: PreviewProvider {
    static var previews: some View {
        JClassFemaleView()
    }
}
