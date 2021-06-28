//
//  Container.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 31/5/21.
//

import Foundation
import SwiftUI


// MARK:-Cargo Hold Class
class CargoHold: ObservableObject {

    //MARK:- Properties
    @Published var position11 = UnderFloor()
    @Published var position12 = UnderFloor() 
    @Published var position13 = UnderFloor()
    @Published var position14 = UnderFloor()
    @Published var position21 = UnderFloor()
    @Published var position22 = UnderFloor()
    @Published var position23 = UnderFloor()
    @Published var position24 = UnderFloor()
    @Published var position31 = UnderFloor()
    @Published var position32 = UnderFloor()
    @Published var position33 = UnderFloor()
    @Published var position41 = UnderFloor()
    @Published var position42 = UnderFloor()
    @Published var position43 = UnderFloor()
//    @Published var bulkHold = BulkHold()
    @Published var bulkHold = UnderFloor()
    @Published var overWeightAlert: WeightLimit? = nil
//    @Published var compartment1Enabled = true
//    @Published var compartment2Enabled = true
//    @Published var compartment3Enabled = true
//    @Published var compartment4Enabled = true
//    @Published var compartment5Enabled = true
    @Published var overWeightAmount = 0


//MARK:- Cargo Loaded Logic
    var hasCargo: Bool {
        if forwardHoldTotalWeight
            + aftHoldTotalWeight
            + compartment5TotalWeight == 0 {
            return false
        } else {
            return true
        }
    }
//MARK:- Weight Calculations

    var compartment1TotalBagWeight: Int {
        position11.totalBagWeight
            + position12.totalBagWeight
            + position13.totalBagWeight
            + position14.totalBagWeight
    }
    var compartment1TotalCargoWeight: Int {
        position11.totalCargoWeight
            + position12.totalCargoWeight
            + position13.totalCargoWeight
            + position14.totalCargoWeight

    }
    var compartment1TotalWeight: Int {
        position11.totalWeight
            + position12.totalWeight
            + position13.totalWeight
            + position14.totalWeight
    }
    var compartment2TotalBagWeight: Int {
        position21.totalBagWeight
            + position22.totalBagWeight
            + position23.totalBagWeight
            + position24.totalBagWeight
    }
    var compartment2TotalCargoWeight: Int {
        position21.totalCargoWeight
            + position22.totalCargoWeight
            + position23.totalCargoWeight
            + position24.totalCargoWeight
    }
    var compartment2TotalWeight: Int {
        position21.totalWeight
            + position22.totalWeight
            + position23.totalWeight
            + position24.totalWeight
    }
    var forwardHoldTotalWeight: Int {
       compartment1TotalWeight + compartment2TotalWeight
    }
    var compartment3TotalBagWeight: Int {
        position31.totalBagWeight
            + position32.totalBagWeight
            + position33.totalBagWeight
    }
    var compartment3TotalCargoWeight: Int {
        position31.totalCargoWeight
            + position32.totalCargoWeight
            + position33.totalCargoWeight
    }
    var compartment3TotalWeight: Int {
        position31.totalWeight
            + position32.totalWeight
            + position33.totalWeight
    }
    var compartment4TotalBagWeight: Int {
        position41.totalBagWeight
            + position42.totalBagWeight
            + position43.totalBagWeight
    }
    var compartment4TotalCargoWeight: Int {
        position41.totalCargoWeight
            + position42.totalCargoWeight
            + position43.totalCargoWeight
    }
    var compartment4TotalWeight: Int {
        position41.totalWeight
            + position42.totalWeight
            + position43.totalWeight
    }
    var aftHoldTotalWeight: Int {
        compartment3TotalWeight + compartment4TotalWeight
    }
    var compartment5TotalWeight: Int {
        bulkHold.bulkTotalWeight
    }



// MARK: Index Unit Calculations
    let returnIndex = CargoIndexUnit()

    var compartment1IndexUnit: Double {
        returnIndex.forCompartment1(using: compartment1TotalWeight)
    }
    var compartment2IndexUnit: Double {
        returnIndex.forCompartment2(using: compartment2TotalWeight)
    }
    var compartment3IndexUnit: Double {
        returnIndex.forCompartment3(using: compartment3TotalWeight)
    }
    var compartment4IndexUnit: Double {
        returnIndex.forCompartment4(using: compartment4TotalWeight)
    }
    var compartment5IndexUnit: Double {
        returnIndex.forCompartment5(using: compartment5TotalWeight)
    }

    var totalAdjustment: (weight: Int, indexUnit: Double) {
         let weight = forwardHoldTotalWeight
            + aftHoldTotalWeight
            + compartment5TotalWeight
        let indexUnit = compartment1IndexUnit
            + compartment2IndexUnit
            + compartment3IndexUnit
            + compartment4IndexUnit
            + compartment5IndexUnit
        return (weight, indexUnit)
    }


    //MARK:- Weight Protection Methods
// If any limits are exceeded, use logic to disable all other compartments until the overweight condition is rectified.

    func validateCompartmentWeight(_ compartmentWeight: Int) {
        overWeightAlert = nil

        if compartment1TotalWeight >
            WeightLimit.compartment1.maxWeight {

            overWeightAlert = .compartment1
            overWeightAmount = compartment1TotalWeight - WeightLimit.compartment1.maxWeight
        }

        if compartment2TotalWeight >
            WeightLimit.compartment2.maxWeight {

            overWeightAlert = .compartment2
            overWeightAmount = compartment2TotalWeight -
                WeightLimit.compartment2.maxWeight
        }
        if compartment3TotalWeight >
            WeightLimit.compartment3.maxWeight {

            overWeightAlert = .compartment3
            overWeightAmount = compartment3TotalWeight -
                WeightLimit.compartment3.maxWeight
        }
        if compartment4TotalWeight >
            WeightLimit.compartment4.maxWeight {

            overWeightAlert = .compartment4
            overWeightAmount = compartment4TotalWeight -
                WeightLimit.compartment4.maxWeight
        }
        if compartment5TotalWeight >
            WeightLimit.compartment5.maxWeight {

            overWeightAlert = .compartment5
            overWeightAmount = compartment5TotalWeight -
                WeightLimit.compartment5.maxWeight
        }

        if overWeightAlert == .compartment1 ||
            overWeightAlert == .compartment2 {
            return
        }
        if forwardHoldTotalWeight >
            WeightLimit.forwardHold.maxWeight {

            overWeightAlert = .forwardHold
            overWeightAmount = forwardHoldTotalWeight -
                WeightLimit.forwardHold.maxWeight
        }

        if overWeightAlert == .compartment3 ||
            overWeightAlert == .compartment4 {
            return
        }
        if aftHoldTotalWeight >
            WeightLimit.aftHold.maxWeight {

            overWeightAlert = .aftHold
            overWeightAmount = aftHoldTotalWeight -
                WeightLimit.aftHold.maxWeight
        }
    }

    func removeOverWeightEntry() {
        removeOverweightInput(for: position11)
        removeOverweightInput(for: position12)
        removeOverweightInput(for: position13)
        removeOverweightInput(for: position14)
        removeOverweightInput(for: position21)
        removeOverweightInput(for: position22)
        removeOverweightInput(for: position23)
        removeOverweightInput(for: position24)
        removeOverweightInput(for: position31)
        removeOverweightInput(for: position32)
        removeOverweightInput(for: position33)
        removeOverweightInput(for: position41)
        removeOverweightInput(for: position42)
        removeOverweightInput(for: position42)
        removeOverweightInput(for: bulkHold)
        overWeightAlert = .none
    }

    func removeOverweightInput(for compartment: UnderFloor) {
        switch compartment.lastSelection {
        case .bagsLeft:
            withAnimation {
                compartment.bagCountLeft = ""
            }
        case .bagsRight:
            withAnimation {
                compartment.bagCountRight = ""
            }
        case .cargoLeft:
            withAnimation {
                compartment.cargoLeft = ""
            }
        case .cargoRight:
            withAnimation {
                compartment.cargoRight = ""
            }
        case .cargoNumber:
            withAnimation {
                compartment.cargoStringWeight = ""
            }
        case .cargoPapa:
            withAnimation {
                compartment.cargoStringWeight = ""
            }
        case .itemsBulk:
            withAnimation {
                compartment.itemBulkStringCount = ""
            }
        case .cargoBulk:
            withAnimation {
                compartment.cargoBulkStringWeight = ""
            }
    }
    }

    var title: String {
        overWeightAlert?.rawValue ?? ""
    }
    var message: String {
        overWeightAlert?.message ?? ""
    }



    func checkCompartment1Weight(int: Int) {
        if compartment1TotalWeight >
            WeightLimit.compartment1.maxWeight {

            overWeightAlert = .compartment1
            overWeightAmount = compartment1TotalWeight - WeightLimit.compartment1.maxWeight
//            compartment1Enabled = true
//            compartment2Enabled = false
//            compartment3Enabled = false
//            compartment4Enabled = false
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
//            overWeightAmount = 0
//            overWeightAlert = nil
     }
    }
    func checkCompartment2Weight(int: Int) {
        if compartment2TotalWeight >
            WeightLimit.compartment2.maxWeight {

            overWeightAlert = .compartment2
            overWeightAmount = compartment2TotalWeight -
                WeightLimit.compartment2.maxWeight
//            compartment1Enabled = false
//            compartment2Enabled = true
//            compartment3Enabled = false
//            compartment4Enabled = false
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }
    func checkCompartment3Weight(int: Int) {
        if compartment3TotalWeight >
            WeightLimit.compartment3.maxWeight {

            overWeightAlert = .compartment3
            overWeightAmount = compartment3TotalWeight -
                WeightLimit.compartment3.maxWeight
//            compartment1Enabled = false
//            compartment2Enabled = false
//            compartment3Enabled = true
//            compartment4Enabled = false
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }
    func checkCompartment4Weight(int: Int) {
        if compartment4TotalWeight >
            WeightLimit.compartment4.maxWeight {

            overWeightAlert = .compartment4
            overWeightAmount = compartment4TotalWeight -
                WeightLimit.compartment4.maxWeight
//            compartment1Enabled = false
//            compartment2Enabled = false
//            compartment3Enabled = false
//            compartment4Enabled = true
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }

    func checkCompartment5Weight(int: Int) {
        if compartment5TotalWeight >
            WeightLimit.compartment5.maxWeight {

            overWeightAlert = .compartment5
            overWeightAmount = compartment5TotalWeight -
                WeightLimit.compartment5.maxWeight
//            compartment1Enabled = false
//            compartment2Enabled = false
//            compartment3Enabled = false
//            compartment4Enabled = false
//            compartment5Enabled = true
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }
    func checkForwardHoldWeight(int: Int) {
        // Prioritise inidividual limits first
        if overWeightAlert == .compartment1 ||
            overWeightAlert == .compartment2 {
            return
        }
        if forwardHoldTotalWeight >
            WeightLimit.forwardHold.maxWeight {

            overWeightAlert = .forwardHold
            overWeightAmount = forwardHoldTotalWeight -
                WeightLimit.forwardHold.maxWeight
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = false
//            compartment4Enabled = false
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }
    func checkAftHoldWeight(int: Int) {
        if overWeightAlert == .compartment3 ||
            overWeightAlert == .compartment4 {
            return
        }
        if aftHoldTotalWeight >
            WeightLimit.aftHold.maxWeight {

            overWeightAlert = .aftHold
            overWeightAmount = aftHoldTotalWeight -
                WeightLimit.aftHold.maxWeight
//            compartment1Enabled = false
//            compartment2Enabled = false
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = false
//        } else {
//            compartment1Enabled = true
//            compartment2Enabled = true
//            compartment3Enabled = true
//            compartment4Enabled = true
//            compartment5Enabled = true
            overWeightAmount = 0
            overWeightAlert = nil
        }
    }

//MARK:- Reset Methods
    func resetCargoToEmpty() {
        withAnimation {
            position11 = UnderFloor()
            position12 = UnderFloor()
            position13 = UnderFloor()
            position14 = UnderFloor()
            position21 = UnderFloor()
            position22 = UnderFloor()
            position23 = UnderFloor()
            position24 = UnderFloor()
            position31 = UnderFloor()
            position32 = UnderFloor()
            position33 = UnderFloor()
            position41 = UnderFloor()
            position42 = UnderFloor()
            position43 = UnderFloor()
            bulkHold = UnderFloor()
        }
    }
//    static let example = CargoHold()
}


