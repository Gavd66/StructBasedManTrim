//
//  FuelDistributionViews.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 20/6/21.
//

import SwiftUI

struct FuelDistributionViews: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {
        Group {
            Toggle("'FUEL IN CENTER'", isOn: $aircraft.fuelInCentreMessage)
            Toggle("Non Standard Fuel Distribution", isOn: $aircraft.nonStandardFuelDistribution)
        }
    }
}

struct FuelDistributionViews_Previews: PreviewProvider {
    static var previews: some View {
        FuelDistributionViews()
    }
}
