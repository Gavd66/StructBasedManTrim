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

        withAnimation{
            HStack {
                Button(action: hideKeyboard) {
                    if zone.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }
                TextField("0 x \(PaxWeight.jChild.weight) kg", text: boundTo.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.default) {
                                    zone.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if zone.hasChildrenInZone {
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

