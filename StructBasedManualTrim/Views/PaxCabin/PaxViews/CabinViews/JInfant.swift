//
//  InfantModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JInfant: View {
    
  
    var boundTo: Binding<Pax>
    var zone: Pax
    
    var body: some View {
        
        withAnimation {
            HStack {
                Button(action: hideKeyboard) {
//                    if zone.hasInfantsInZone {
                    if zone.infants != 0 {
                        Text("\(HasInfants.some.rawValue)")
                            .loadedStyle()
                    } else {
                        Text("\(HasInfants.none.rawValue)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()
                
                TextField("0 x \(PaxWeight.infant.weight) kg", text:
                            boundTo.infantStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
//                if zone.hasInfantsInZone {
                if zone.infants != 0 {
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

