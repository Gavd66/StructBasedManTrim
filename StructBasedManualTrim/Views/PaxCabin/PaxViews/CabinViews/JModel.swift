//
//  BuisnessModel.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//
// Logic to blank all pax and weights if over zone count == true, same for cargo load
import SwiftUI

struct JModel: View {

    @EnvironmentObject  var cabin: Cabin
    var number: Int
    var bindingZone: Binding<Pax>
    var zone: Pax
   
    var body: some View {

        //MARK:- Zone 1
        Picker("Zone\(number)", selection: bindingZone.paxInCabin
                .animation()
                .onChange(zone.applyCabinLogic)) {
            ForEach(CabinStatus.allCases, id: \.self){
                Text("\($0.rawValue)")
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

            if cabin.jWeight == .buisness {
                    JMale(boundTo: bindingZone, zone: zone)

                } else {
                    YMale(boundTo: bindingZone, zone: zone)

                }

            //MARK:- Female

                if cabin.jWeight == .buisness {
                    JFemale(boundTo: bindingZone, zone: zone)
                       
                } else {
                    YFemale(boundTo: bindingZone, zone: zone)
                }

            //MARK:- Children

                if cabin.jWeight == .buisness {
                    JChild(boundTo: bindingZone, zone: zone)

                } else {
                    YChild(boundTo: bindingZone, zone: zone)
                }

            //MARK:- Infants
            // Infants
            JInfant(boundTo: bindingZone, zone: zone)

        }// End Zone 2
    }

    func dismissCabinKeyBoard(_ paxInCabin: CabinStatus) {
        if cabin.zone2.hideKeyboard {
            hideKeyboard()
        }
    }
}
