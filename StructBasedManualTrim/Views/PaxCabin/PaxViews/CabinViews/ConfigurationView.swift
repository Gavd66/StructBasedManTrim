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
        Picker("Pax Weight", selection: $cabin.jWeight.animation()){
            ForEach(JWeightConfiguration.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
        .onChange(of: cabin.jWeight, perform: dismissKeyboard)
        .pickerStyle(SegmentedPickerStyle())
        .contextMenu {
            VStack(alignment: .center) {
                Text("For Domestic")
                Text("and Trans Tasman operations")
                Text("weights are generally set to ecconomy")
            }
            .multilineTextAlignment(.center)
        }
    }
    // used to try and prevent bug of keyboard black space with change of non segmented picker style
    func dismissKeyboard(_ weight: JWeightConfiguration) {
        hideKeyboard()
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}
