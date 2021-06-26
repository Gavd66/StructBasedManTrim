//
//  YClassChildModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YChild: View {

  

    var boundTo: Binding<Pax>
    var zone: Pax

    var body: some View {

        withAnimation {
            HStack {
                Button(action: hideKeyboard) {
                    if zone.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()
                TextField("0 x \(PaxWeight.yChild.weight) kg", text: boundTo.childStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if zone.hasChildrenInZone {
                    Text("\(zone.yChildWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
        }
    }
}

