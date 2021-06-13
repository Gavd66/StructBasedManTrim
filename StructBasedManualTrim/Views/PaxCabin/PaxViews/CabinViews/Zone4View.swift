//
//  Zone4View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 14/6/21.
//

import SwiftUI

struct Zone4View: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        YModel(cabin: _cabin, zoneNumber: 4, bindingZone: $cabin.zone4, zone: cabin.zone4)
    }
}

struct Zone4View_Previews: PreviewProvider {
    static var previews: some View {
        Zone4View()
    }
}
