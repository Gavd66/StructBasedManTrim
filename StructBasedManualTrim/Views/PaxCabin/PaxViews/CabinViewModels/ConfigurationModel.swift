//
//  ConfigurationView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct ConfigurationModel: View {

    @EnvironmentObject var cabin: Cabin
    var body: some View {
        Picker("Configuration", selection: $cabin.configuration) {
            ForEach(Configuration.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationModel()
    }
}
