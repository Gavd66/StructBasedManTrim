//
//  Zone3View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct Zone3View: View {
    @EnvironmentObject  var cabin: Cabin
    var number = 3
    var body: some View {

        //MARK:- Zone 3
        Picker("Zone \(number) ", selection: $cabin.zone3.paxInCabin
                .animation()
                .onChange(cabin.zone3.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(number)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cabin.zone3.paxInCabin, perform: dismissCabinKeyBoard)

        switch cabin.zone3.paxInCabin {
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
                    if cabin.zone3.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yMale.weight) kg", text: $cabin.zone3.maleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone3.updateMaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone3.hasMalesInZone {
                    Text("\(cabin.zone3.yMaleWeight) kg")
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
                    if cabin.zone3.hasFemalesInZone {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yFemale.weight) kg", text: $cabin.zone3.femaleStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone3.updateFemaleLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone3.hasFemalesInZone {
                    Text("\(cabin.zone3.yFemaleWeight) kg")
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
                    if cabin.zone3.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.yChild.weight) kg", text: $cabin.zone3.childrenStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone3.updateChildLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone3.hasChildrenInZone {
                    Text("\(cabin.zone3.yChildWeight) kg")
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
                    if cabin.zone3.hasInfantsInZone {
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
                            $cabin.zone3.infantStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone3.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone3.hasInfantsInZone {
                    Text("\(cabin.zone3.infantWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
            // MARK:- Zone 3 Total View
            // Only display once pax numbers are entered
            if cabin.zone3.hasPaxInZone {
                Zone3TotalView()
                    .padding(.top)
            }
        }// End Zone 3
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone3.hideKeyboard {
            hideKeyboard()
        }
    }
}

struct Zone3View_Previews: PreviewProvider {
    static var previews: some View {
        Zone3View()
    }
}
