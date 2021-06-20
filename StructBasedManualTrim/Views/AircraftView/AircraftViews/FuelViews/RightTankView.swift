//
//  RightTankView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct RightTankView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {

        TankViewModel(whichTankHasFuel: aircraft.rightTankHasFuel, tankLabelwithFuel: RightTank.some.rawValue, tankLabelwithoutFuel: RightTank.none.rawValue, tankValue: $aircraft.rightTankStringNumber)
    }
}

struct RightTankView_Previews: PreviewProvider {
    static var previews: some View {
        RightTankView()
    }
}
