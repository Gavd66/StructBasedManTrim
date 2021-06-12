//
//  Zone2View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct Zone2View: View {
    @EnvironmentObject  var cabin: Cabin
    var number = 2
    var body: some View {

        //MARK:- Zone 2
        Picker("Zone \(number) ", selection: $cabin.zone2.paxInCabin
                .animation()
                .onChange(cabin.zone2.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(number)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cabin.zone2.paxInCabin, perform: dismissCabinKeyBoard)

        switch cabin.zone2.paxInCabin {
        case .empty:
            HStack {
                Spacer()
                Text("Zone\(number) Empty")
                    .nilFitStyle()
                Spacer()
            }
        case .paxCarried:
//MARK:- Males
            HStack {
                Button(action: hideKeyboard) {
                    if cabin.zone2.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yMale.weight) kg", text: $cabin.zone2.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone2.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone2.hasMalesInZone {
                    Text("\(cabin.zone2.yMaleWeight) kg")
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
                    if cabin.zone2.hasFemalesInZone {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yFemale.weight) kg", text: $cabin.zone2.femaleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone2.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone2.hasFemalesInZone {
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
                    if cabin.zone2.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yChild.weight) kg", text: $cabin.zone2.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone2.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone2.hasChildrenInZone {
                    Text("\(cabin.zone2.yChildWeight) kg")
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
                    if cabin.zone2.hasInfantsInZone {
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
                            $cabin.zone2.infantStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone2.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone2.hasInfantsInZone {
                    Text("\(cabin.zone2.infantWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
// MARK:- Zone 2 Total View
            // Only display once pax numbers are entered
            if cabin.zone2.isNotEmpty {
                Zone2TotalView()
                    .padding(.top)
            }
        }// End Zone 2
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }
}

struct Zone2View_Previews: PreviewProvider {
    static var previews: some View {
        Zone2View()
    }
}
