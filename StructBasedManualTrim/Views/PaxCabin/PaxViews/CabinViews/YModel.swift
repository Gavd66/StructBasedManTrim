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
        Picker("Zone\(zoneNumber)", selection: bindingZone.paxLoadedStatus
                .animation()
                .onChange(zone.applyCabinLogic)) {
            ForEach(PaxLoadedStatus.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: zone.paxLoadedStatus, perform: dismissCabinKeyBoard)

        switch zone.paxLoadedStatus {
        case .noPaxOnboard:
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
            YInfant(boundTo: bindingZone, zone: zone)

        }// End Zone 2
    }
    
    func dismissCabinKeyBoard(_ paxInCabin: PaxLoadedStatus) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }
}
