//
//  JClassFemaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JFemale: View {
    
   
    
    var boundTo: Binding<Pax>
    var zone: Pax
    
    var body: some View {
        withAnimation {
            
            HStack {
                Button(action: hideKeyboard) {
//                    if zone.hasFemalesInZone {
                    if zone.females != 0 {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                    }
                }
                .capsuleStyle()
                TextField("0 x \(PaxWeight.jFemale.weight) kg", text: boundTo.femaleStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
//                if zone.hasFemalesInZone {
                if zone.females != 0 {
                    Text("\(zone.jFemaleWeight) kg")
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

