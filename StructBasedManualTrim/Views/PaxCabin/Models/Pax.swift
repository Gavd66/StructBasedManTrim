//
//  Pax.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import Foundation
import SwiftUI

//MARK: - Class Pax
class Pax: ObservableObject, Equatable {

    static func == (lhs: Pax, rhs: Pax) -> Bool {
        lhs.id == rhs.id
    }

    var id = UUID() // For error messages & abstracted code

    @Published var maleStringNumber = "" {
        didSet {
            if maleStringNumber != "" {
                lastInputWasMale = true
                lastInputWasFemale = false
                lastInputWasChild = false
                lastInputWasInfant = false
            }
        }
    }
    @Published var femaleStringNumber = "" {
        didSet {
            if femaleStringNumber != "" {
                lastInputWasMale = false
                lastInputWasFemale = true
                lastInputWasChild = false
                lastInputWasInfant = false
            }
        }
    }
    @Published var childrenStringNumber = "" {
        didSet {
            if childrenStringNumber != "" {
                lastInputWasMale = false
                lastInputWasFemale = false
                lastInputWasChild = true
                lastInputWasInfant = false
            }
        }
    }
    @Published var infantStringNumber = "" {
        didSet {
            if infantStringNumber != "" {
                lastInputWasMale = false
                lastInputWasFemale = false
                lastInputWasChild = false
                lastInputWasInfant = true
            }
        }
    }
    var paxLoadedStatus: PaxLoadedStatus = .noPaxOnboard
    var hasMalesInZone = false
    var hasFemalesInZone = false
    var hasChildrenInZone = false
    var hasInfantsInZone = false
    var hasPeopleInZone = false
    var hideKeyboard = true
    @Published var lastInputWasMale = false
    @Published var lastInputWasFemale = false
    @Published var lastInputWasChild = false
    @Published var lastInputWasInfant = false

//MARK:- Pax Number Calulations
    var males: Int {
        Int(maleStringNumber) ?? 0
    }
    var females: Int {
        Int(femaleStringNumber) ?? 0
    }
    var children: Int {
        Int(childrenStringNumber) ?? 0
    }
    var infants: Int {
        Int(infantStringNumber) ?? 0
    }
    var totalPax: Int {
        males + females + children + infants
    }
    var seatedPax: Int {
        males + females + children
    }
    var totalInfants: Int {
        infants
    }

// MARK: - Weight Calculations
    var jMaleWeight: Int {
        males * PaxWeight.jMale.weight
    }
    var jFemaleWeight: Int {
        females * PaxWeight.jFemale.weight
    }
    var yMaleWeight: Int {
        males * PaxWeight.yMale.weight
    }
    var yFemaleWeight: Int {
        females * PaxWeight.yFemale.weight
    }
    var jChildWeight: Int {
        children * PaxWeight.jChild.weight
    }
    var yChildWeight: Int {
        children * PaxWeight.yChild.weight
    }
    var infantWeight: Int {
        infants * PaxWeight.infant.weight
    }
    var buisnessWeight: Int {
        jMaleWeight + jFemaleWeight + jChildWeight + infantWeight
    }
    var ecconomyWeight: Int {
        yMaleWeight + yFemaleWeight + yChildWeight + infantWeight
    }

// MARK: - PAX Cabin Logic Methods
    // Reset all values and dismiss keyboard on change
    func applyCabinLogic(_ paxCarried: PaxLoadedStatus) {
        switch paxCarried {
        case .noPaxOnboard:
            maleStringNumber = ""
            femaleStringNumber = ""
            childrenStringNumber = ""
            infantStringNumber = ""
            hasMalesInZone = false
            hasFemalesInZone = false
            hasChildrenInZone = false
            hasInfantsInZone = false
            hasPeopleInZone = false
            hideKeyboard = true

        case .paxCarried:
            maleStringNumber = ""
            femaleStringNumber = ""
            childrenStringNumber = ""
            infantStringNumber = ""
            hasMalesInZone = false
            hasFemalesInZone = false
            hasChildrenInZone = false
            hasInfantsInZone = false
            hasPeopleInZone = false
            hideKeyboard = true
        }
    }

    func updateMaleLables(_ maleString: String) {
        hasMalesInZone = (maleStringNumber != "") ? true: false
    }
    func updateFemaleLables(_ femaleString: String) {
        hasFemalesInZone = (femaleStringNumber != "") ?  true: false
    }
    func updateChildLables(_ childString: String) {
        hasChildrenInZone = (childrenStringNumber != "") ?  true: false
    }
    func updateInfantLables(_ infantString: String) {
        hasInfantsInZone = (infantStringNumber != "") ?  true: false
    }
    var hasPaxInZone: Bool {
        if hasMalesInZone
            || hasFemalesInZone
            || hasChildrenInZone
            || hasInfantsInZone {
            return true
        } else {
            return false
        }
    }
}
//MARK:- Class Cabin
class Cabin: ObservableObject {

    @Published var zone1 = Pax()
    @Published var zone2 = Pax()
    @Published var zone3 = Pax()
    @Published var zone4 = Pax()
    @Published var jWeight: JWeightConfiguration = .buisness
    @Published var seatingError: SeatingLogic? = nil {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var cabinCrew = CabinCrew.zero
    @Published var moveCabinCrew = false {
        didSet { // On hide set to same zone so no weight adjustment
            if moveCabinCrew == false {
                moveFrom = .A3
                moveTo = .A3
            }
        }
    }
    @Published var moveFrom = CrewMoveFrom.A3
    @Published var moveTo = CrewMoveTo.A3
    @Published var jumpseat: Jumpseat = .none

    var hasPax: Bool {
        if (zone1.hasPaxInZone
                || zone2.hasPaxInZone
                || zone3.hasPaxInZone
                || zone4.hasPaxInZone) {
            return true
        } else {
            return false
        }
    }

    // MARK:- POB Number Calulation

    var totalPaxNumbers: Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }

    var totalInfants: Int {
       zone1.infants + zone2.infants + zone3.infants + zone4.infants
    }

    var permittedInfantNumber: Int {
        // Max infant number depends on total seated pax load
        let totalSeatedPax =
            zone1.seatedPax
            + zone2.seatedPax
            + zone3.seatedPax
            + zone4.seatedPax

        switch totalSeatedPax {
        case 0...332:
            return SeatingLogic.forInfants.maxNumber
        case 333:
            return SeatingLogic.forInfants.maxNumber - 1
        case 334:
            return SeatingLogic.forInfants.maxNumber - 2
        case 335:
            return SeatingLogic.forInfants.maxNumber - 3
        default:
            return SeatingLogic.forInfants.maxNumber
        }
    }

    var totalCrewNumber: Int {
        cabinCrew.number + jumpseat.number + 2
    }
    var totalPOB: Int {
        totalPaxNumbers + totalCrewNumber
    }

    //MARK: - Pax Zone Weight Calculations

    var totalPaxWeight: Int {
        switch jWeight {
        case .buisness:
            return zone1.buisnessWeight
                + zone2.ecconomyWeight
                + zone3.ecconomyWeight
                + zone4.ecconomyWeight

        case .ecconomy:
            return zone1.ecconomyWeight
                + zone2.ecconomyWeight
                + zone3.ecconomyWeight
                + zone4.ecconomyWeight
        }
    }

    // To allow abstracted generic labels in Zone 1 model to display weights
    func zoneBuisnessWeight(for zone: Pax) -> Int {
        zone.buisnessWeight
    }

    func zoneEcconomyWeight(for zone: Pax) -> Int {
        zone.ecconomyWeight
    }

    // MARK:- Index Unit Calculations

    var indexUnitZone1: Double {
        let indexUnit = ZoneIndexUnit()
        switch jWeight {
        case .buisness:
            return indexUnit.forZone1(using: zone1.buisnessWeight)
        case .ecconomy:
            return indexUnit.forZone1(using: zone1.ecconomyWeight)
        }
    }
    var indexUnitZone2: Double {
        let indexUnit = ZoneIndexUnit()
        return indexUnit.forZone2(using: zone2.ecconomyWeight)
    }

    var indexUnitZone3: Double {
        let indexUnit = ZoneIndexUnit()
        return indexUnit.forZone2(using: zone3.ecconomyWeight)
    }

    var indexUnitZone4: Double {
        let indexUnit = ZoneIndexUnit()
        return indexUnit.forZone2(using: zone4.ecconomyWeight)
    }

    var cabinCrewWeightIndex: (weight: Int, indexUnit: Double) {
        let weightIndex = CabinCrewIndex()
       return weightIndex.forCabinCrewNumber(using: cabinCrew.number)
    }

    var jumpseatWeightIndex: (weight:Int, indexUnit:Double) {
        let weightIndex = JumpSeatWeightIndex()
        return weightIndex.forJumpSeat(using: jumpseat.number)
    }


// MARK: - Seating Logic

    func validPaxLoad(_ seats: Int) {
        // If over seating in a zone occurs, the input is removed.
        seatingError = nil
        if totalPaxNumbers != 0 && cabinCrew.number == 0 {
            seatingError = .noCabinCrew
        }

        if zone1.seatedPax > SeatingLogic.forZone1.maxNumber {
           seatingError = .forZone1
        }

        if zone2.seatedPax > SeatingLogic.forZone2.maxNumber {
            seatingError = .forZone2
        }

        if zone3.seatedPax > SeatingLogic.forZone3.maxNumber {
            seatingError = .forZone3
        }

        if zone4.seatedPax > SeatingLogic.forZone4.maxNumber {
            seatingError = .forZone4
        }

        if totalInfants > permittedInfantNumber {
          seatingError = .forInfants
        }

        if seatingError == .none {

            resetLastInput(for: zone1)
            resetLastInput(for: zone2)
            resetLastInput(for: zone3)
            resetLastInput(for: zone4)
        }
    }
    // Reset all to register the next number that is entered
    func resetLastInput(for zone: Pax) {
        zone.lastInputWasMale = false
        zone.lastInputWasFemale = false
        zone.lastInputWasChild = false
        zone.lastInputWasInfant = false
    }



    // Animate the removal of the entry that created the error
    func removeLastEntry() {
        // Remove the entry that caused the seating error condition
        removeLastInput(for: zone1)
        removeLastInput(for: zone2)
        removeLastInput(for: zone3)
        removeLastInput(for: zone4)
        // after removal there is no seating error, reset it to nil
        seatingError = .none
    }

    func removeLastInput(for zone: Pax) {
        if zone.lastInputWasMale {
            zone.maleStringNumber = ""
        }
        if zone.lastInputWasFemale {
            zone.femaleStringNumber = ""
        }
        if zone.lastInputWasChild {
            zone.childrenStringNumber = ""
        }
        if zone.lastInputWasInfant {
            zone.infantStringNumber = ""
        }
    }

    // MARK: - Seating Error Messages

    var zoneTitle: String {
        switch seatingError {
        case .forZone1:
            return SeatingLogic.forZone1.rawValue + " Seating Error"
        case .forZone2:
            return SeatingLogic.forZone2.rawValue + " Seating Error"
        case .forZone3:
            return SeatingLogic.forZone3.rawValue + " Seating Error"
        case .forZone4:
            return SeatingLogic.forZone4.rawValue + " Seating Error"
        case .forInfants:
            return SeatingLogic.forInfants.rawValue + " Seating Error"
        case .noCabinCrew:
            return SeatingLogic.noCabinCrew.rawValue
        case .none:
            return ""
        }
    }

    var infantGrammar: String {
        let infantNumber = totalInfants - permittedInfantNumber

        if infantNumber == 1 {
            return "1 Infant needs to be removed"
        } else {
            return "\(infantNumber) Infants need to be removed"
        }
    }
    var zoneMessage: String {
        switch seatingError {
        case .forZone1:
            return SeatingLogic.forZone1.message + " Reduce the number you entered by  \(zone1.seatedPax - SeatingLogic.forZone1.maxNumber) to proceed "
        case .forZone2:
            return SeatingLogic.forZone2.message + " Reduce the number you entered by  \(zone2.seatedPax - SeatingLogic.forZone2.maxNumber) to proceed "
        case .forZone3:
            return SeatingLogic.forZone3.message + " Reduce the number you entered by  \(zone3.seatedPax - SeatingLogic.forZone3.maxNumber) to proceed."
        case .forZone4:
            return SeatingLogic.forZone4.message + " Reduce the number you entered by  \(zone4.seatedPax - SeatingLogic.forZone4.maxNumber) to proceed "
        case .forInfants:
            return SeatingLogic.forInfants.message + infantGrammar
        case .noCabinCrew:
            return SeatingLogic.noCabinCrew.message
        case .none:
            return ""
        }
    }

    //MARK:- Cabin Reset
    func resetCabin() {
        withAnimation {
        zone1 = Pax.init()
        zone2 = Pax.init()
        zone3 = Pax.init()
        zone4 = Pax.init()
        jumpseat = Jumpseat.none
        cabinCrew = CabinCrew.zero
        }
    }
}

