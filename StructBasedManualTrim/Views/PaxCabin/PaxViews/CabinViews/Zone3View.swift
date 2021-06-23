//
//  Zone3View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 14/6/21.
//

import SwiftUI

struct Zone3View: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        YModel(cabin: cabin, zoneNumber: 3, bindingZone: $cabin.zone3, zone: cabin.zone3)
    }
}

struct Zone3View_Previews: PreviewProvider {
    static var previews: some View {
        Zone3View()
    }
}
