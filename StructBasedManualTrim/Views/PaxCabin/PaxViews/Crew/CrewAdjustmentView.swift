//
//  CabinCrewViews.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct CrewAdjustmentView: View {


    @EnvironmentObject var cabin: Cabin

    var body: some View {
        Picker("Number of Cabin Crew", selection: $cabin.cabinCrew) {
            ForEach(CabinCrew.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
        }

        Toggle("MEL XXXX", isOn: $cabin.moveCabinCrew.animation())

        if cabin.moveCabinCrew {

            Picker("Crew moved from:", selection: $cabin.moveFrom) {
                ForEach(CrewMoveFrom.allCases, id: \.self) {
                    Text("\($0.rawValue)")
                }
            }

            Picker("Crew moved to: ", selection: $cabin.moveTo) {
                ForEach(CrewMoveTo.allCases, id: \.self) {
                    Text("\($0.rawValue)")
                }
            }
        }
    }
}

struct CabinCrewViews_Previews: PreviewProvider {
    @EnvironmentObject var cabin: Cabin
    static var previews: some View {
        CrewAdjustmentView()
    }
}
