//
//  RightTankView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 18/6/21.
//

import SwiftUI

struct CentreTankView: View {

    @EnvironmentObject var aircraft: Aircraft
    var body: some View {
        TankViewModel(whichTankHasFuel: aircraft.centreTankHasFuel, tankLabelwithFuel: CentreTank.some.rawValue, tankLabelwithoutFuel: CentreTank.none.rawValue, tankValue: $aircraft.centreTankStringNumber)
    }
}

struct CentreTankView_Previews: PreviewProvider {
    static var previews: some View {
        CentreTankView()
    }
}
