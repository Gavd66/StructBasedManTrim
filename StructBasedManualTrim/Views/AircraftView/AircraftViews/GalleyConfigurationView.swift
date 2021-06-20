//
//  SwiftUIView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct GalleyConfigurationView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {
        Picker("Catering", selection: $aircraft.galleyConfiguration) {
            ForEach(GalleyConfiguration.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        //.pickerStyle(SegmentedPickerStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GalleyConfigurationView()
    }
}
