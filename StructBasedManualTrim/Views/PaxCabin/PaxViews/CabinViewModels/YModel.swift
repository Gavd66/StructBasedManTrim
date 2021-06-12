//
//  EcconomyViewModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct YModel: View {

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

                YMale(boundTo: boundTo, forZone: forZone)
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

                YFemale(boundTo: boundTo, forZone: forZone, zoneTotal: zoneTotal)
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

                YChild(boundTo: boundTo, forZone: forZone, zoneTotal: zoneTotal)
            }
            .font(.system(size: 18))
            //MARK:- Infants
            // Infants
            Infant(boundTo: boundTo, forZone: forZone, zoneTotal: zoneTotal)
            YTotals(cabin: _cabin, zone: forZone, zoneTotal: zoneTotal)
        }// End Zone 2
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }

}


