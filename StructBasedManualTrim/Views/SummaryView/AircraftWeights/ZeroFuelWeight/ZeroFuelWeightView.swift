//
//  ZeroFuelWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 22/6/21.
//

import SwiftUI

struct ZeroFuelWeightView: View {

    @EnvironmentObject var cargo: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft
    
    var jet: Jet {
         Jet(cargo: cargo, cabin: cabin, aircraft: aircraft)
    }

    var body: some View {

        HighlightView(
            title: "\(jet.aircraft.registration.rawValue)",
            weightType: jet.zeroFuel.weight,
            indexUnit: jet.zeroFuel.indexUntit)
    }
}



struct ZeroFuelWeightView_Previews: PreviewProvider {
    static var previews: some View {
        ZeroFuelWeightView()
    }
}
