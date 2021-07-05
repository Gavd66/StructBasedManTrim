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
    @Published var bulkHold = UnderFloor()
    @Published var overWeightAlert: WeightLimit? = nil
    @Published var overWeightAmount = 0
    var compartment1 = Compartment1.position11
    var compartment2 = Compartment2.position21
    var compartment3 = Compartment3.position31
    var compartment4 = Compartment4.position41
    var forwardHold = ForwardHold.position11
    var aftHold = AftHold.position31



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
// If any limits are exceeded, use logic to remove the last input that caused the overweight condition



    func validateCompartmentWeight(_ compartmentWeight: Int) {
        overWeightAlert = nil
// MARK: Compartment1
        if compartment1TotalWeight >
            WeightLimit.compartment1.maxWeight {
            // assign the position that causes the overweight condition
            if compartmentWeight == position11.totalWeight {
                compartment1 = .position11
            }
            if compartmentWeight == position12.totalWeight {
                compartment1 = .position12
            }
            if compartmentWeight == position13.totalWeight {
                compartment1 = .position13
            }
            if compartmentWeight == position14.totalWeight {
                compartment1 = .position14
            }

            overWeightAlert = .compartment1
            overWeightAmount = compartment1TotalWeight - WeightLimit.compartment1.maxWeight
        }
//MARK: Compartment2
        if compartment2TotalWeight >
            WeightLimit.compartment2.maxWeight {
            if compartmentWeight == position21.totalWeight {
                compartment2 = .position21
            }
            if compartmentWeight == position22.totalWeight {
                compartment2 = .position22
            }
            if compartmentWeight == position23.totalWeight {
                compartment2 = .position23
            }
            if compartmentWeight == position24.totalWeight {
                compartment2 = .position24
            }

            overWeightAlert = .compartment2
            overWeightAmount = compartment2TotalWeight -
                WeightLimit.compartment2.maxWeight
        }
 // MARK: Compartment3
        if compartment3TotalWeight >
            WeightLimit.compartment3.maxWeight {
            if compartmentWeight == position31.totalWeight {
                compartment3 = .position31
            }
            if compartmentWeight == position32.totalWeight {
                compartment3 = .position32
            }
            if compartmentWeight == position33.totalWeight {
                compartment3 = .position33
            }
            overWeightAlert = .compartment3
            overWeightAmount = compartment3TotalWeight -
                WeightLimit.compartment3.maxWeight
        }
        // MARK: Compartment4
        if compartment4TotalWeight >
            WeightLimit.compartment4.maxWeight {
            if compartmentWeight == position41.totalWeight {
                compartment4 = .position41
            }
            if compartmentWeight == position42.totalWeight {
                compartment4 = .position42
            }
            if compartmentWeight == position43.totalWeight {
                compartment4 = .position43
            }

            overWeightAlert = .compartment4
            overWeightAmount = compartment4TotalWeight -
                WeightLimit.compartment4.maxWeight
        }
        //MARK: Compartment5
        if compartment5TotalWeight >
            WeightLimit.compartment5.maxWeight {

            overWeightAlert = .compartment5
            overWeightAmount = compartment5TotalWeight -
                WeightLimit.compartment5.maxWeight
        }
        //MARK: Forward Hold
        // Rectify individual compartments before the forward hold
        if overWeightAlert == .compartment1 ||
            overWeightAlert == .compartment2 {
            return
        }
        if forwardHoldTotalWeight >
            WeightLimit.forwardHold.maxWeight {
            if compartmentWeight == position11.totalWeight {
                forwardHold = .position11
            }
            if compartmentWeight == position12.totalWeight {
                forwardHold = .position12
            }
            if compartmentWeight == position13.totalWeight {
                forwardHold = .position13
            }
            if compartmentWeight == position14.totalWeight {
                forwardHold = .position14
            }
            if compartmentWeight == position21.totalWeight {
                forwardHold = .position21
            }
            if compartmentWeight == position22.totalWeight {
                forwardHold = .position22
            }
            if compartmentWeight == position23.totalWeight {
                forwardHold = .position23
            }
            if compartmentWeight == position24.totalWeight {
                forwardHold = .position24
            }
            overWeightAlert = .forwardHold
            overWeightAmount = forwardHoldTotalWeight -
                WeightLimit.forwardHold.maxWeight
        }
        //MARK: Aft Hold
        // Rectify individual compartments before the Aft hold

        if overWeightAlert == .compartment3 ||
            overWeightAlert == .compartment4 {
            return
        }
        if aftHoldTotalWeight >
            WeightLimit.aftHold.maxWeight {
            if compartmentWeight == position31.totalWeight {
                aftHold = .position31
            }
            if compartmentWeight == position32.totalWeight {
                aftHold = .position32
            }
            if compartmentWeight == position33.totalWeight {
                aftHold = .position33
            }
            if compartmentWeight == position41.totalWeight {
                aftHold = .position41
            }
            if compartmentWeight == position42.totalWeight {
                aftHold = .position42
            }
            if compartmentWeight == position43.totalWeight {
                aftHold = .position43
            }

            overWeightAlert = .aftHold
            overWeightAmount = aftHoldTotalWeight -
                WeightLimit.aftHold.maxWeight
        }
    }
//MARK: Removal Methods
    func removeOverWeightEntry(for weightAlert: WeightLimit) {
        switch weightAlert {
        case .compartment1:
            switch compartment1 {
            case .position11:
                removeOverweightInput(for: position11)
            case .position12:
                removeOverweightInput(for: position12)
            case .position13:
                removeOverweightInput(for: position13)
            case .position14:
                removeOverweightInput(for: position14)
            }
        case .compartment2:
            switch compartment2 {
            case .position21:
                removeOverweightInput(for: position21)
            case .position22:
                removeOverweightInput(for: position22)
            case .position23:
                removeOverweightInput(for: position23)
            case .position24:
                removeOverweightInput(for: position24)
            }

        case .compartment3:
            switch compartment3 {
            case .position31:
                removeOverweightInput(for: position31)
            case .position32:
                removeOverweightInput(for: position32)
            case .position33:
                removeOverweightInput(for: position33)
            }
        case .compartment4:
            switch compartment4 {
            case .position41:
                removeOverweightInput(for: position41)
            case .position42:
                removeOverweightInput(for: position42)
            case .position43:
                removeOverweightInput(for: position43)
            }
        case .compartment5:
            removeOverweightInput(for: bulkHold)
        case .forwardHold:
            switch forwardHold {
            case .position11:
                removeOverweightInput(for: position11)
            case .position12:
                removeOverweightInput(for: position12)
            case .position13:
                removeOverweightInput(for: position13)
            case .position14:
                removeOverweightInput(for: position14)
            case .position21:
                removeOverweightInput(for: position21)
            case .position22:
                removeOverweightInput(for: position22)
            case .position23:
                removeOverweightInput(for: position23)
            case .position24:
                removeOverweightInput(for: position24)
            }

        case .aftHold:
            switch aftHold {
            case .position31:
                removeOverweightInput(for: position31)
            case .position32:
                removeOverweightInput(for: position32)
            case .position33:
                removeOverweightInput(for: position33)
            case .position41:
                removeOverweightInput(for: position41)
            case .position42:
                removeOverweightInput(for: position42)
            case .position43:
                removeOverweightInput(for: position43)
            }
            // Compartment 5 only has two inputs, they are removed directly
        }
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
                compartment.cargoPapaStringWeight = ""
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
       let message = overWeightAlert?.message ?? ""
       let weightToRemove = " by \(overWeightAmount) kg."
       return message + weightToRemove
    }

    var cargo: String {
        switch overWeightAlert {
        case .compartment1:
            switch compartment1 {
            case .position11:
                return position11.lastSelection.rawValue
            case .position12:
                return position12.lastSelection.rawValue
            case .position13:
                return position13.lastSelection.rawValue
            case .position14:
                return position14.lastSelection.rawValue
            }
        case .compartment2:
            switch compartment2 {
            case .position21:
                return position21.lastSelection.rawValue
            case .position22:
                return position22.lastSelection.rawValue
            case .position23:
                return position23.lastSelection.rawValue
            case .position24:
                return position24.lastSelection.rawValue

            }
        case .compartment3:
            switch compartment3 {
            case .position31:
                return position31.lastSelection.rawValue
            case .position32:
                return position32.lastSelection.rawValue
            case .position33:
                return position33.lastSelection.rawValue

            }
        case .compartment4:
            switch compartment4 {
            case .position41:
                return position41.lastSelection.rawValue
            case .position42:
                return position42.lastSelection.rawValue
            case .position43:
                return position43.lastSelection.rawValue

            }
        case .compartment5:
            if bulkHold.lastSelection == .itemsBulk {
                return "Items from Bulk"
            }
            if bulkHold.lastSelection == .cargoBulk {
                return "Cargo from Bulk"
            }
        case .forwardHold:
            switch forwardHold {
            case .position11:
                return position11.lastSelection.rawValue
            case .position12:
                return position12.lastSelection.rawValue
            case .position13:
                return position13.lastSelection.rawValue
            case .position14:
                return position14.lastSelection.rawValue
            case .position21:
                return position21.lastSelection.rawValue
            case .position22:
                return position22.lastSelection.rawValue
            case .position23:
                return position23.lastSelection.rawValue
            case .position24:
                return position24.lastSelection.rawValue

            }
        case .aftHold:
            switch aftHold {
            case .position31:
                return position31.lastSelection.rawValue
            case .position32:
                return position32.lastSelection.rawValue
            case .position33:
                return position33.lastSelection.rawValue
            case .position41:
                return position41.lastSelection.rawValue
            case .position42:
                return position42.lastSelection.rawValue
            case .position43:
                return position43.lastSelection.rawValue
            }
        case .none:
            return ""
        }// End
            return ""
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


