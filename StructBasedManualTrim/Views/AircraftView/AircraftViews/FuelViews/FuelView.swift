//
//  FuelView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct FuelView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {
        Group {
            LeftTankView()
            CentreTankView()
            RightTankView()
            EICASDisplayView()
        }
    }
}

struct FuelView_Previews: PreviewProvider {
    static var previews: some View {
        FuelView()
    }
}
