//
//  Zone2View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 14/6/21.
//

import SwiftUI

struct Zone2View: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        YModel(cabin: _cabin, zoneNumber: 2, bindingZone: $cabin.zone2, zone: cabin.zone2)           
    }
}

struct Zone2View_Previews: PreviewProvider {
    static var previews: some View {
        Zone2View()
    }
}
