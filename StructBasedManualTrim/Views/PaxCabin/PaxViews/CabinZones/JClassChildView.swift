//
//  JClassChildView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct JClassChildView: View {
    @EnvironmentObject var cabin: Cabin

    var body: some View {
        if cabin.configuration == .standard {

            TextField("0 x \(PaxWeight.jChild.weight) kg", text: $cabin.zone1.childrenStringNumber
                        .animation()
                        .onChange(
                            withAnimation(.easeIn(duration: 2)) {
                                cabin.zone1.updateChildLables
                            }
                        ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            if cabin.zone1.hasChildrenInZone {
                Text("\(cabin.zone1.jChildWeight) kg")
                    .loadedStyle()
            } else {
                Text("0 kg ")
                    .emptyStyle()
            }


        } else {

            if cabin.configuration == .domestic {
                TextField("0 x \(PaxWeight.yChild.weight) kg", text: $cabin.zone1.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone1.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                if cabin.zone1.hasChildrenInZone {
                    Text("\(cabin.zone1.yChildWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }

            }

        }
    }
}

struct JClassChildView_Previews: PreviewProvider {
    static var previews: some View {
        JClassChildView()
    }
}
