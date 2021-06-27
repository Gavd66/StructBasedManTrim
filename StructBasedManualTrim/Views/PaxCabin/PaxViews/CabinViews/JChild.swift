//
//  JClassChildModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JChild: View {

  
    var zone: Pax
    var boundTo: Binding<Pax>

    var body: some View {

        withAnimation {
            HStack {
                Button(action: hideKeyboard) {
//                    if zone.hasChildrenInZone {
                    if zone.children != 0 {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()
                TextField("0 x \(PaxWeight.jChild.weight) kg", text: boundTo.childStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

//                if zone.hasChildrenInZone {
                if zone.children != 0 {
                    Text("\(zone.jChildWeight) kg")
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

