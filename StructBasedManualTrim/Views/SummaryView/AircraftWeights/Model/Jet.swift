//
//  Jet.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import Foundation
import SwiftUI

class Jet {

    @ObservedObject var cargo: CargoHold
    @ObservedObject var cabin: Cabin
    @ObservedObject var aircraft: Aircraft
     var weightError: WeightError?

    init(cargo: CargoHold, cabin: Cabin, aircraft: Aircraft) {
        self.cargo = cargo
        self.cabin = cabin
        self.aircraft = aircraft
    }

    var zeroFuel: (weight: Int, indexUnit: Double) {
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

    var takeoffFuel: (weight: Int, indexUnit: Double) {
        if aircraft.fuelDistribution == .nonStandard {
           return (aircraft.nonStandardTakeoffFuel, aircraft.nonStandardTakeoffIndexUnit)
        } else {
            return (aircraft.takeoffFuel, aircraft.takeoffFuelIndexUnit)
        }
    }
// change these
    var takeoff: (weight: Int, indexUnit: Double) {
        if aircraft.fuelDistribution == .nonStandard {
            let weight = zeroFuel.weight + aircraft.nonStandardTakeoffFuel
            let indexUnit = zeroFuel.indexUnit + aircraft.nonStandardTakeoffIndexUnit
            return (weight, indexUnit)
        } else {

            let weight = zeroFuel.weight + aircraft.takeoffFuel
            let indexUnit = zeroFuel.indexUnit + aircraft.takeoffFuelIndexUnit
            return(weight, indexUnit)
        }
    }

    var landingWeight: Int {
        takeoff.weight - aircraft.fuelBurn
    }

    

    

    

}
