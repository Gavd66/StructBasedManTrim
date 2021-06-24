//
//  LandingWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct LandingWeightView: View {

    @EnvironmentObject var cargo: CargoHold
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var jet: Jet {
        Jet(cargo: cargo, cabin: cabin, aircraft: aircraft)
    }
    var body: some View {
        WeightOnlyView(title: "Landing Weight",
                       weightType: jet.landingWeight)
    }
}

struct LandingWeightView_Previews: PreviewProvider {
    static var previews: some View {
        LandingWeightView()
    }
}
