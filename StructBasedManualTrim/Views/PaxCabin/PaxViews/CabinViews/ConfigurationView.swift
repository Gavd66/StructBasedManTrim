//
//  ConfigurationView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct ConfigurationView: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {
        Picker("Weights used", selection: $cabin.jWeight) {
            ForEach(JWeightConfiguration.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
       // .pickerStyle(SegmentedPickerStyle())
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}
