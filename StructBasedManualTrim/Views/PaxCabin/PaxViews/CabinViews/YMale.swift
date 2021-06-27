//
//  YClassMaleModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//
// Finish redoing the new hybrid, keep each in its own view
import SwiftUI

struct YMale: View {
  
    var boundTo: Binding<Pax>
    var zone: Pax

    var body: some View {
        withAnimation(.default) {

            HStack {
                Button(action: hideKeyboard) {
//                    if zone.hasMalesInZone {
                    if zone.males != 0 {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }
                
                TextField("0 x \(PaxWeight.yMale.weight) kg", text: boundTo.maleStringNumber.animation())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

//                if zone.hasMalesInZone {
                if zone.males != 0 {
                    Text("\(zone.yMaleWeight) kg")
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


