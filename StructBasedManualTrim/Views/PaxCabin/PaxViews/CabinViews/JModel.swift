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
//                        .gesture(
//                            TapGesture()
//                                .onEnded({ _ in
//                                    print("Zone 1 Jfemale tapped")
//                                    setTappedZone(for: zone)
//                                   // hideKeyboard()
//                                })
//                        )
                } else {
                    YFemale(boundTo: bindingZone, zone: zone)
//                        .gesture(
//                            TapGesture()
//                                .onEnded({ _ in
//                                    print("Zone 1 Yfemale tapped")
//                                    setTappedZone(for: zone)
//                                    //hideKeyboard()
//                                })
//                        )
                }

            //MARK:- Children
// Implement for all and set also for seating
                if cabin.jWeight == .buisness {
                    JChild(boundTo: bindingZone, zone: zone)
//                        .gesture(
//                            TapGesture()
//                                .onEnded({ _ in
////                                       if zone == cabin.zone1 {
////                                        print("Zone 1 Child tapped")
////                                        cabin.zoneTapped = .zone1
//                                    setTappedZone(for: zone)
//                                   // }
//                                   // hideKeyboard()
//                                })
//                        )
                } else {
                    YChild(boundTo: bindingZone, zone: zone)
//                        .gesture(
//                            TapGesture()
//                                .onEnded({ _ in
//                                    print("Zone 1 Ychild tapped")
//                                    setTappedZone(for: zone)
//                                   // hideKeyboard()
//                                })
//                        )
                }

            
            //MARK:- Infants
            // Infants
            JInfant(boundTo: bindingZone, zone: zone)
                .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            print("Zone 1 infant tapped")
                            cabin.setTappedZone(for: zone)
                           // hideKeyboard()

                        })
                )
          
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
