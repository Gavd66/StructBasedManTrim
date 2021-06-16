//
//  Zone1View.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 13/6/21.
//

import SwiftUI

struct Zone1View: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        JModel(cabin: _cabin, number: 1, bindingZone: $cabin.zone1, zone: cabin.zone1)
    }
}

struct Zone1View_Previews: PreviewProvider {
    static var previews: some View {
        Zone1View()
    }
}
