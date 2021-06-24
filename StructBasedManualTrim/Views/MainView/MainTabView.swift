//
//  MainTabView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var cargo = CargoHold()
    @StateObject var cabin = Cabin()
    @StateObject var aircraft = Aircraft()

    var body: some View {
        TabView {

            CargoHoldView()

                .tabItem {
                    Image(systemName: "bag.badge.plus")
                    Text("Cargo")
                }

            PaxCabinView()

                .tabItem {
                    Image(systemName: "person.3")
                    Text("POB")
                }
            AircraftView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Aircraft")
                }
            SummaryView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Manual Chart")
                }
        }
        .environmentObject(cargo)
        .environmentObject(cabin)
        .environmentObject(aircraft)

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
