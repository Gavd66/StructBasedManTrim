//
//  YClassFemaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YFemale: View {

    @EnvironmentObject  var cabin: Cabin
    
    var boundTo: Binding<Pax>
    var zone: Pax
    //var zoneTotal: Seats

    var body: some View {
        //MARK:- Females
        withAnimation {
            HStack {
                Button(action: hideKeyboard) {
                    if zone.hasFemalesInZone {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }
                
                TextField("0 x \(PaxWeight.yFemale.weight) kg", text: boundTo.femaleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.default) {
                                    zone.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if zone.hasFemalesInZone {
                    Text("\(zone.yFemaleWeight) kg")
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


