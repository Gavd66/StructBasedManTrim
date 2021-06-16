//
//  CabinCrewViews.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 12/6/21.
//

import SwiftUI

struct CabinCrewView: View {


    @EnvironmentObject var cabin: Cabin

    var body: some View {
        Picker("Number of Cabin Crew", selection: $cabin.cabinCrew.animation()) {
            ForEach(CabinCrew.allCases, id: \.self) {
                Text("\($0.rawValue)")
            }
            .onChange(of: cabin.cabinCrew, perform: dismissKeyboard)
        }

        Toggle("MEL 25-25-01-01A", isOn: $cabin.moveCabinCrew.animation())

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
    func dismissKeyboard(crew: CabinCrew) {
        hideKeyboard()
    }
}

struct CabinCrewViews_Previews: PreviewProvider {
    @EnvironmentObject var cabin: Cabin
    static var previews: some View {
        CabinCrewView()
    }
}
