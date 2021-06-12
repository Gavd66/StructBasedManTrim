//
//  Zone1View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import SwiftUI

struct Zone1View: View {
    @EnvironmentObject  var cabin: Cabin
    var number = 1
    var body: some View {

//MARK:- Zone 1
        Picker("Zone \(number) ", selection: $cabin.zone1.paxInCabin
                .animation()
                .onChange(cabin.zone1.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(number)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: cabin.zone1.paxInCabin, perform: dismissCabinKeyBoard)

        switch cabin.zone1.paxInCabin {
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
                    if cabin.zone1.hasMalesInZone {
                        Text("\(HasMales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasMales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

               JClassMaleView()
            }
            .font(.system(size: 18))

//MARK: - Females
            HStack {
                Button(action: hideKeyboard) {
                    if cabin.zone1.hasFemalesInZone {
                        Text("\(HasFemales.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasFemales.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }
               JClassFemaleView()
            }
            .font(.system(size: 18))

// MARK: - Children
            HStack {
                Button(action: hideKeyboard) {
                    if cabin.zone1.hasChildrenInZone {
                        Text("\(HasChildren.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasChildren.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

               JClassChildView()
            }
            .font(.system(size: 18))
//MARK:- Infants
            HStack {
                Button(action: hideKeyboard) {
                    if cabin.zone1.hasInfantsInZone {
                        Text("\(HasInfants.some.rawValue)")
                            .loadedStyle()
                            .capsuleStyle()
                    } else {
                        Text("\(HasInfants.none.rawValue)")
                            .emptyStyle()
                            .capsuleStyle()
                    }
                }

                TextField("0 x \(PaxWeight.infant.weight) kg", text:
                            $cabin.zone1.infantStringNumber
                            .animation()
                            .onChange(
                                withAnimation(.easeIn(duration: 2)) {
                                    cabin.zone1.updateInfantLables
                                }
                            ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                if cabin.zone1.hasInfantsInZone {
                    Text("\(cabin.zone1.infantWeight) kg")
                        .loadedStyle()
                } else {
                    Text("0 kg ")
                        .emptyStyle()
                }
            }
            .font(.system(size: 18))
// MARK:- Zone 1 Total View
            // Only display once pax numbers are entered
            if cabin.zone1.hasPaxInZone {
                withAnimation(.easeIn(duration: 5)) {
                Zone1TotalView()
                    .padding(.top)
            }
            }
        }// End Zone 1
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone1.hideKeyboard {
            hideKeyboard()
        }
    }
}

struct Zone1View_Previews: PreviewProvider {
    static var previews: some View {
        Zone1View()
    }
}
