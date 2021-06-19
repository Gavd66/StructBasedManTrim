//
//  Aircraft.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

class Aircraft: ObservableObject {

    @Published var registration = Registration.vkh
    @Published var galleyConfiguration = GalleyConfiguration.dom
    @Published var leftTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateLeftTankLabel() // used to help animate change in label
            applyInputLogic(for: leftTankStringNumber)
        }
    }
    @Published var centreTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateCentreLabel()
            applyInputLogic(for: centreTankStringNumber)
        }
    }
    @Published var rightTankStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateRightTankLabel()
            applyInputLogic(for: rightTankStringNumber)
        }
    }
    @Published var fuelBurnStringNumber = "" {
        didSet {
            objectWillChange.send()
            updateFuelBurnLabel()
        }
    }
    @Published var leftTankHasFuel = false
    @Published var centreTankHasFuel = false
    @Published var rightTankHasFuel = false
    @Published var fuelBurnEntered = false
    @Published var lastInputLeftTank = false
    @Published var lastInputCentreTank = false
    @Published var lastInputRightTank = false
    @Published var fuelError: FuelError?

//MARK:- Fuel Calculations and Logic
    var leftTank: Int {
        let double = Double(leftTankStringNumber) ?? 0
        let weight = Int(double * 1000)

        return weight
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

    var fuelBurn: Int {
        Int(fuelBurnStringNumber) ?? 0
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

    func applyInputLogic(for fuelTank: String) {
        if fuelTank == leftTankStringNumber {
            lastInputCentreTank = false
            lastInputRightTank = false
        }
        if fuelTank == centreTankStringNumber {
            lastInputLeftTank = false
            lastInputRightTank = false
        }
        if fuelTank == rightTankStringNumber {
            lastInputLeftTank = false
            lastInputCentreTank = false
        }
    }

   // MARK:- Error Methods

    func checkForFuelError(using fuelTank: Int) {

      //  fuelError = .none // Start with no error, only set if true
        if fuelTank == leftTank {
            if fuelTank > 17000 {
                fuelError = .leftTankOverLimit
                leftTankStringNumber = ""
            }
            if fuelTank == centreTank {
                if fuelTank > 67500 {
                    fuelError = .centreTankOverLimit
                    centreTankStringNumber = ""
                }
            }
            if fuelTank == rightTank {
                if fuelTank > 17000 {
                    fuelError = .rightTankOverLimit
                    rightTankStringNumber = ""
                }
            }
        }
        
    }
}
