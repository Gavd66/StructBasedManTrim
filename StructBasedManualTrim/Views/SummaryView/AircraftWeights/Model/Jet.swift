//
//  Jet.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import Foundation
import SwiftUI

class Jet: ObservableObject {

    @Published var cargo: CargoHold
    @Published var cabin: Cabin
    @Published var aircraft: Aircraft
    @Published var weightError: WeightError?

    init(cargo: CargoHold, cabin: Cabin, aircraft: Aircraft) {
        self.cargo = cargo
        self.cabin = cabin
        self.aircraft = aircraft
    }

    var zeroFuel: (weight: Int, indexUntit: Double) {
        let weight = aircraft.totalAdjustment.weight
            + cargo.totalAdjustment.weight
            + cabin.totalAdjustment.weight
        let indexUnit = aircraft.totalAdjustment.indexUnit
            + cargo.totalAdjustment.indexUnit
            + cabin.totalAdjustment.indexUnit

        return (weight, indexUnit)
    }

    var taxiWeight: Int {
        zeroFuel.weight + aircraft.totalFuel
    }

    var takeoff: (weight: Int, indexUnit: Double) {
        let weight = zeroFuel.weight + aircraft.takeoffFuel
        let indexUnit = zeroFuel.indexUntit + aircraft.takeoffFuelIndexUnit
        return(weight, indexUnit)
    }

    var landingWeight: Int {
        takeoff.weight - aircraft.fuelBurn
    }

    

    

    

}
