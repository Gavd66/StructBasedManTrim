//
//  BuisnessModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct JModel: View {

    @EnvironmentObject  var cabin: Cabin
    var number: Int
    var bindingZone: Binding<Pax>
    var zone: Pax
    var zoneLimit: Seats


    var body: some View {

        //MARK:- Zone 1
        Picker("Zone\(number)", selection: bindingZone.paxInCabin
                .animation()
                .onChange(zone.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(number)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: zone.paxInCabin, perform: dismissCabinKeyBoard)

        switch zone.paxInCabin {
        case .empty:
            HStack {
                Spacer()
                Text("Zone\(number) Empty")
                    .nilFitStyle()
                Spacer()
            }
        case .paxCarried:
            //MARK:- Males

                if cabin.configuration == .standard {
                    JMale(boundTo: bindingZone, zone: zone)
                } else {
                    YMale(boundTo: bindingZone, zone: zone)
                }

            //MARK:- Female

                if cabin.configuration == .standard {
                    JFemale(boundTo: bindingZone, zone: zone)
                } else {
                    YFemale(boundTo: bindingZone, zone: zone)
                }


            //MARK:- Children

                if cabin.configuration == .standard {
                    JChild(boundTo: bindingZone, zone: zone)
                } else {
                    YChild(boundTo: bindingZone, zone: zone)
                }

            //MARK:- Infants
            // Infants
            Infant(boundTo: bindingZone, zone: zone)
            JTotals(cabin: _cabin, zone: zone, zoneLimit: zoneLimit)
        }// End Zone 2
    }

    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }
}
