//
//  EcconomyViewModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct EcconomyModel: View {
    @EnvironmentObject  var cabin: Cabin
    var zoneNumber: Int
    var boundTo: Binding<Pax>
    var forZone: Pax
    var zoneTotal: Seats


    var body: some View {

        //MARK:- Zone 2
        Picker("Zone\(zoneNumber)", selection: boundTo.paxInCabin
                .animation()
                .onChange(forZone.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(zoneNumber)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: forZone.paxInCabin, perform: dismissCabinKeyBoard)

        switch forZone.paxInCabin {
        case .empty:
            HStack {
                Spacer()
                Text("Zone\(zoneNumber) Empty")
                    .nilFitStyle()
                Spacer()
            }
        case .paxCarried:
            //MARK:- Males
            HStack {
                Button(action: hideKeyboard) {
                    if forZone.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yMale.weight) kg", text: boundTo.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    forZone.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if forZone.hasMalesInZone {
                    Text("\(forZone.yMaleWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))

            //MARK:- Females
            HStack {
                Button(action: hideKeyboard) {
                    if forZone.hasFemalesInZone {
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
                                withAnimation(.easeIn(duration: 2)) {
                                    forZone.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if forZone.hasFemalesInZone {
                    Text("\(cabin.zone2.yFemaleWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))

            //MARK:- Children
            HStack {
                Button(action: hideKeyboard) {
                    if forZone.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yChild.weight) kg", text: boundTo.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    forZone.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if forZone.hasChildrenInZone {
                    Text("\(forZone.yChildWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
            //MARK:- Infants
            // Infants
            HStack {
                Button(action: hideKeyboard) {
                    if forZone.hasInfantsInZone {
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
                                withAnimation(.easeIn(duration: 2)) {
                                    forZone.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if forZone.hasInfantsInZone {
                    Text("\(cabin.zone2.infantWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
         
            TotalsYClassModel(cabin: _cabin, zone: forZone, zoneTotal: zoneTotal)
        }// End Zone 2
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }

}


