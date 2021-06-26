//
//  FinalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 21/6/21.
//

import SwiftUI

struct SummaryView: View {

    @EnvironmentObject var cargo: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft
    
    var body: some View {
        NavigationView {
            Form {

                Group { // Aircraft Weight Group
                    Section(header: Text("Operating Weight")
                                .foregroundColor(.primary)) {
                      OperatingWeightView()
                    }

                    Section(header: Text("Adjustments")
                                .foregroundColor(.primary)) {
                        AdjustmentView()
                    }
                    Section(header: Text("Adjusted Operating Weight")
                                .foregroundColor(.primary)) {
                        AdjustedOperatingWeightView()
                    }

                } // End Aircraft Weight Group
                Group { // Cargo and Cabin
                    Section(header: Text("Cargo")
                                .foregroundColor(.primary)) {
                        CargoView()
                    }
                    Section(header: Text("Cabin")
                                .foregroundColor(.primary)) {
                        CabinView()
                    }

                } // Cargo Cabin Group

                Group { // Limit Weight Group
                    Section(header: Text("Zero Fuel Weight and Index")
                                .foregroundColor(.primary)) {
                        ZeroFuelWeightView()
                    }

                    Section(header: Text("TaxiWeight")
                                .foregroundColor(.primary)) {
                        TaxiWeightView()
                    }

                    Section(header: Text("Takeoff Weight and Index")
                                .foregroundColor(.primary)) {
                        TakeoffWeightView()
                    }

                    Section(header: Text("Landing Weight")
                                .foregroundColor(.primary)) {
                        LandingWeightView()
                    }
                }
            } // EndForm
            .navigationTitle("Summary")

        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
