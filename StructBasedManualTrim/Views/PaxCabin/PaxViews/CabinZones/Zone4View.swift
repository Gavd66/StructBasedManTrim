//
//  Zone4View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct Zone4View: View {
    @EnvironmentObject  var cabin: Cabin
    var number = 4
    var body: some View {

        //MARK:- Zone 4
        Picker("Zone \(number) ", selection: $cabin.zone4.paxInCabin
                .animation()
                .onChange(cabin.zone4.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(number)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cabin.zone4.paxInCabin, perform: dismissCabinKeyBoard)

        switch cabin.zone4.paxInCabin {
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
                    if cabin.zone4.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yMale.weight) kg", text: $cabin.zone4.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone4.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone4.hasMalesInZone {
                    Text("\(cabin.zone4.yMaleWeight) kg")
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
                    if cabin.zone4.hasFemalesInZone {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yFemale.weight) kg", text: $cabin.zone4.femaleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone4.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone4.hasFemalesInZone {
                    Text("\(cabin.zone4.yFemaleWeight) kg")
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
                    if cabin.zone4.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yChild.weight) kg", text: $cabin.zone4.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone4.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone4.hasChildrenInZone {
                    Text("\(cabin.zone4.yChildWeight) kg")
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
                    if cabin.zone4.hasInfantsInZone {
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
                            $cabin.zone4.infantStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone4.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone4.hasInfantsInZone {
                    Text("\(cabin.zone4.infantWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
            // MARK:- Zone 4 Total View
            // Only display once pax numbers are entered
            if cabin.zone4.isNotEmpty {
                Zone4TotalView()
                    .padding(.top)
            }
        }// End Zone 4
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone4.hideKeyboard {
            hideKeyboard()
        }
    }
}

struct Zone4View_Previews: PreviewProvider {
    static var previews: some View {
        Zone4View()
    }
}
