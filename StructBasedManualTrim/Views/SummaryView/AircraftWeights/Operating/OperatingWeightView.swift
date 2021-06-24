//
//  OperatingWeightView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct OperatingWeightView: View {
    @EnvironmentObject var cabin: Cabin
    @EnvironmentObject var aircraft: Aircraft

    var body: some View {

        WeightIndexFormatView(
            title: "\(aircraft.registration.rawValue)",
            weightType: aircraft.registration.details.weight,
            indexUnit: aircraft.registration.details.indexUnit)

    }
}

struct OperatingWeightView_Previews: PreviewProvider {
    static var previews: some View {
        OperatingWeightView()
    }
}
