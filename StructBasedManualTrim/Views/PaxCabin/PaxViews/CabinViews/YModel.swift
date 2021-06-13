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
    var bindingZone: Binding<Pax>
    var zone: Pax
  
    var body: some View {

        //MARK:- Zone 2
        Picker("Zone\(zoneNumber)", selection: bindingZone.paxInCabin
                .animation()
                .onChange(zone.applyCabinLogic)) {
            ForEach(CabinOccupency.allCases, id: \.self){
                Text("Zone\(zoneNumber)\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: zone.paxInCabin, perform: dismissCabinKeyBoard)

        switch zone.paxInCabin {
        case .empty:
            HStack {
                Spacer()
                Text("Zone\(zoneNumber) Empty")
                    .nilFitStyle()
                Spacer()
            }
        case .paxCarried:
            //MARK:- Males

            YMale(boundTo: bindingZone, zone: zone)
            //MARK:- Females

            YFemale(boundTo: bindingZone, zone: zone)

            //MARK:- Children

            YChild(boundTo: bindingZone, zone: zone)
            //MARK:- Infants

            Infant(boundTo: bindingZone, zone: zone)
        
        }// End Zone 2
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }

}


