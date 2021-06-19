//
//  LeftTankView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct LeftTankView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        TankViewModel(whichTankHasFuel: aircraft.leftTankHasFuel, tankLabelwithFuel: LeftTank.some.rawValue, tankLabelwithoutFuel: LeftTank.none.rawValue, tankValue: $aircraft.leftTankStringNumber)
    }
}

struct LeftTankView_Previews: PreviewProvider {
    static var previews: some View {
        LeftTankView()
    }
}
