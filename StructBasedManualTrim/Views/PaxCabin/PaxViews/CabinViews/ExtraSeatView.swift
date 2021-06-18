//
//  ExtraSeatView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import SwiftUI

struct ExtraSeatView: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {

        Toggle("Instrument/Dog/Pax", isOn: $cabin.extraSeatAdjustment.animation())

// MARK:- Instrument
        if cabin.extraSeatAdjustment {
            Toggle("For Instrument", isOn: $cabin.instrumentOnSeat.animation())

            if cabin.instrumentOnSeat {
                Picker("Number of Instruments", selection: $cabin.instrument) {
                    ForEach(Instrument.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
            }
//MARK:- Service Dog
            Toggle("For Service Dog", isOn: $cabin.serviceDogInCabin.animation())

            if cabin.serviceDogInCabin {
                Toggle("Dog in Zone 1", isOn: $cabin.zone1.hasServiceDogInZone.animation())

                if cabin.zone1.hasServiceDogInZone {
                    Picker("Number of dogs", selection: $cabin.zone1.serviceDog) {
                        ForEach(ServiceDog.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Dog in Zone 2", isOn: $cabin.zone2.hasServiceDogInZone.animation())

                if cabin.zone2.hasServiceDogInZone {
                    Picker("Number of dogs", selection: $cabin.zone2.serviceDog) {
                        ForEach(ServiceDog.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Dog in Zone 3", isOn: $cabin.zone3.hasServiceDogInZone.animation())
                if cabin.zone3.hasServiceDogInZone {
                    Picker("Number of dogs", selection: $cabin.zone3.serviceDog) {
                        ForEach(ServiceDog.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Dog in Zone 4", isOn: $cabin.zone4.hasServiceDogInZone.animation())
                if cabin.zone4.hasServiceDogInZone {
                    Picker("Number of dogs", selection: $cabin.zone4.serviceDog) {
                        ForEach(ServiceDog.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

            } // end if

//MARK:- Oversize Pax
            Toggle("For Oversize Pax", isOn: $cabin.oversizePaxInCabin.animation())
            if cabin.oversizePaxInCabin {
                Toggle("Oversize Pax Zone 1", isOn: $cabin.zone1.hasOversizePaxInZone.animation())

                if cabin.zone1.hasOversizePaxInZone {
                    Picker("Number of Pax", selection: $cabin.zone1.oversizePax) {
                        ForEach(OverSizePax.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Oversize Pax Zone 2", isOn: $cabin.zone2.hasOversizePaxInZone.animation())

                if cabin.zone2.hasOversizePaxInZone {
                    Picker("Number of Pax", selection: $cabin.zone2.oversizePax) {
                        ForEach(OverSizePax.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Oversize Pax in Zone 3", isOn: $cabin.zone3.hasOversizePaxInZone.animation())

                if cabin.zone3.hasOversizePaxInZone {
                    Picker("Number of Pax", selection: $cabin.zone3.oversizePax) {
                        ForEach(OverSizePax.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }

                Toggle("Oversize Pax in Zone 4", isOn: $cabin.zone4.hasOversizePaxInZone.animation())
                if cabin.zone4.hasOversizePaxInZone {
                    Picker("Number of Pax", selection: $cabin.zone4.oversizePax) {
                        ForEach(OverSizePax.allCases, id:\.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }
            }
        }
    } // End Body
}

struct ExtraSeatView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraSeatView()
    }
}
