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
                Text("\($0.rawValue)")
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
//                .gesture(
//                    TapGesture()
//                        .onEnded({ _ in
//                            print("Y female zone\(zoneNumber) tapped")
//                            setTappedZone(for: zone)
//                            hideKeyboard()
//
//                        })
//                )
            //MARK:- Females

            YFemale(boundTo: bindingZone, zone: zone)
//                .gesture(
//                    TapGesture()
//                        .onEnded({ _ in
//                            print("Zone 1 infant tapped")
//                            setTappedZone(for: zone)
//                            hideKeyboard()
//
//                        })
//                )

            //MARK:- Children

            YChild(boundTo: bindingZone, zone: zone)

            //MARK:- Infants
            YInfant(boundTo: bindingZone, zone: zone)
                
        
        }// End Zone 2
    }
    func dismissCabinKeyBoard(_ paxInCabin: CabinOccupency) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }
//    func setTappedZone(for zone: Pax) {
//        if zone == cabin.zone1 {
//            cabin.zoneTapped = .zone1
//        }
//        if zone == cabin.zone2 {
//            cabin.zoneTapped = .zone2
//        }
//        if zone == cabin.zone3 {
//            cabin.zoneTapped = .zone3
//        }
//        if zone == cabin.zone4 {
//            cabin.zoneTapped = .zone4
//        }
//    }
}
