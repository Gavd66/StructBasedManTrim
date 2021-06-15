//
//  InfantModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JInfant: View {
    
    @EnvironmentObject  var cabin: Cabin
    var boundTo: Binding<Pax>
    var zone: Pax
    
    var body: some View {
        
        withAnimation {
            HStack {
                Button(action: hideKeyboard) {
                    if zone.hasInfantsInZone {
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
                                withAnimation(.default) {
                                    zone.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                if zone.hasInfantsInZone {
                    Text("\(zone.infantWeight) kg")
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

