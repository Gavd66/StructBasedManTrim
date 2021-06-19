//
//  RegistrationViewd.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct RegistrationView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        Picker("Registration", selection: $aircraft.registration) {
            ForEach(Registration.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
    }
}

struct RegistrationViewd_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
