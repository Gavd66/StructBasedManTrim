//
//  Aircraft.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation
import SwiftUI

class Aircraft: ObservableObject {

    @Published var registration = Registration.none
    @Published var galleyConfiguration = GalleyConfiguration.dom
    @Published var leftTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateLeftTankLabel() // help animate change in label
            lastInput = .leftTank
        }
    }
    @Published var centreTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateCentreLabel()
            lastInput = .centreTank
        }
    }
    @Published var rightTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateRightTankLabel()
            lastInput = .rightTank
        }
    }
    @Published var fuelBurnStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateFuelBurnLabel()
            lastInput = .fuelBurn
        }
    }
    @Published var leftTankHasFuel = false
    @Published var centreTankHasFuel = false
    @Published var rightTankHasFuel = false
    @Published var fuelBurnEntered = false
    @Published var fuelError: FuelError?
    @Published var lastInput = LastInput.leftTank
    @Published var nonStandardFuelDistribution = false
    @Published var fuelInCentreMessage = false
    @Published var potableWater = PotableWater.from284Litres

//MARK:- Fuel Calculations and Logic
    var leftTank: Int {
        let double = Double(leftTankStringNumber) ?? 0
        return Int(double * 1000)
    }
    var centreTank: Int {
        let double = Double(centreTankStringNumber) ?? 0
        return Int(double * 1000)
    }
    var rightTank: Int {
        let double = Double(rightTankStringNumber) ?? 0
        return Int(double * 1000)
    }
    var hasFuelLoaded: Bool {
        if leftTank == 0 && centreTank == 0 && rightTank == 0 {
            return false
        } else {
            return true
        }
    }
    var totalFuel: Int {
        leftTank + centreTank + rightTank
    }
    var takeoffFuel: Int {
        totalFuel - 400
    }
    var fuelBurn: Int {
        Int(fuelBurnStringNumber) ?? 0
    }

// Used as a value to check for fuel errors with checkForFuelError()
    var fuelValue: Int {
        switch lastInput {
        case .leftTank:
            return leftTank
        case .centreTank:
            return centreTank
        case .rightTank:
            return rightTank
        case .fuelBurn:
            return fuelBurn
        }
    }

// MARK:- Index Unit Methods
//    //Standard Fuel Distribution
    var takeoffFuelIndexUnit: Double {
        let indexUnit = StandardFuelWeightIndex()
        return indexUnit.forStandardFuelDistribution(using: takeoffFuel)
    }
    // NonStandard Fuel Distribution

    var leftTankTakeoff: (weight: Int, indexUnit: Double) {
        let weightIndex =
            NonStandardFuelDistribution(message: fuelInCentreMessage)
        let takeoff = weightIndex.forLeftTank(using: leftTank)
        return (takeoff.weight, takeoff.indexUnit)
    }
    var centreTankTakeoff: (weight: Int, indexUnit: Double) {
        let weightIndex =
            NonStandardFuelDistribution(message: fuelInCentreMessage)
        let takeoff = weightIndex.forCentreTank(using: centreTank)
        return (takeoff.weight, takeoff.indexUnit)
    }
    var rightTankTakeoff: (weight: Int, indexUnit: Double) {
        let weightIndex =
            NonStandardFuelDistribution(message: fuelInCentreMessage)
        let takeoff = weightIndex.forRightTank(using: rightTank)
        return (takeoff.weight, takeoff.indexUnit)
    }

    var nonStandardTakeoffFuel: Int {
        leftTankTakeoff.weight
            + centreTankTakeoff.weight
            + rightTankTakeoff.weight
    }

    var nonStandardTakeoffIndexUnit: Double {
        leftTankTakeoff.indexUnit
            + centreTankTakeoff.indexUnit
            + rightTankTakeoff.indexUnit
    }

    // Galley
    var galley: (weight: Int, indexUnit: Double) {
        let weightIndex = GalleyWeightIndex()
        let galley = weightIndex.forGalley(using: galleyConfiguration)
        return (galley.weight, galley.indexUnit)
    }
    // Water
    var water: (weight: Int, indexUnit: Double) {
        let weightIndex = PotableWaterWeightIndex()
        let water = weightIndex.forWaterLevel(using: potableWater)
        return (water.weight, water.indexUnit)
    }

    //MARK:- Logic Methods

    func updateLeftTankLabel() {
        leftTankHasFuel =
            (leftTankStringNumber != "")
            ? true: false
    }
    func updateCentreLabel() {
        centreTankHasFuel
            = (centreTankStringNumber != "")
            ? true : false
    }
    func updateRightTankLabel() {
        rightTankHasFuel =
            (rightTankStringNumber != "")
            ? true : false
    }
    func updateFuelBurnLabel() {
        fuelBurnEntered =
            (fuelBurnStringNumber != "")
            ? true : false
    }

   // MARK:- Error Methods

    func checkForFuelError(_ fuelInput: Int)  {
        fuelError = .none // Start with no error, only set if true

        switch lastInput {
        case .leftTank:
            if fuelInput > 17711 {
                fuelError = .leftTankOverLimit
            }
        case .centreTank:
            if fuelInput > 70590 {
                fuelError = .centreTankOverLimit
            }
        case .rightTank:
            if fuelInput > 17711 {
                fuelError = .rightTankOverLimit
            }
        case .fuelBurn:
            if fuelInput > totalFuel {
                fuelError = .fuelBurn
            }
        }
    }

    func removeFuel() {
        switch lastInput {
        case .leftTank:
            withAnimation {
                leftTankStringNumber = ""
            }
        case .centreTank:
            withAnimation {
                centreTankStringNumber = ""
            }
        case .rightTank:
            withAnimation {
                rightTankStringNumber = ""
            }
        case .fuelBurn:
            withAnimation {
                fuelBurnStringNumber = ""
            }
        }
    }

    var errorTitle: String {
        fuelError?.rawValue ?? ""
    }
    var errorMessage: String {
        fuelError?.message ?? ""
    }
}
