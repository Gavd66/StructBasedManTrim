//
//  TaxiWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct TaxiWeightView: View {

    @EnvironmentObject var cargo: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var jet: Jet {
        Jet(cargo: cargo, cabin: cabin, aircraft: aircraft)
    }

    var body: some View {
        
        WeightOnlyView(
            title: "Total Fuel Onboard",
            weightType: jet.aircraft.totalFuel)
        WeightOnlyView(
            title: "Taxi Weight",
            weightType: jet.taxiWeight)
        
    }
}

struct TaxiWeightView_Previews: PreviewProvider {
    static var previews: some View {
        TaxiWeightView()
    }
}
