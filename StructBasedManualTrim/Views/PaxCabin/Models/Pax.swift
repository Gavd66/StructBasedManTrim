//
//  Pax.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 10/6/21.
//

import Foundation
import SwiftUI



// MARK:- Enum Aircraft Jweight setting
enum JWeightConfiguration: String, Identifiable, CaseIterable {
    var id: JWeightConfiguration { self }
    case buisness = "Buisness"
    case ecconomy = "Ecconomy"
}
//MARK: - Enum Pax Weights
enum PaxWeight: Identifiable {
    var id: PaxWeight { self }
    case jMale
    case jFemale
    case yMale
    case yFemale
    case jChild
    case yChild
    case infant

    var weight: Int {
        switch self {
        case .jMale:
            return 101
        case .jFemale:
            return 86
        case .yMale:
            return 93
        case .yFemale:
            return 78
        case .jChild:
            return 48
        case .yChild:
            return 49
        case .infant:
            return 16
        }
    }

    
}
// MARK: Cabin Occupency Enums
enum CabinOccupency: String, Identifiable, CaseIterable {
    var id: CabinOccupency { self }
    case empty = " Empty"
    case paxCarried = " Load Pax"
}

enum HasMales: String, Identifiable {
    var id: HasMales { self }
    case some = "  Males  "
    case none = "  No Males  "
}

enum HasFemales: String, Identifiable {
    var id: HasFemales { self }
    case some = "Females"
    case none = "No Females"
}

enum HasChildren: String, Identifiable {
    var id: HasChildren { self }
    case some = "Children"
    case none = "No Children"
}

enum HasInfants: String, Identifiable {
    var id: HasInfants { self }
    case some = " Infants "
    case none = " No Infants "
}

enum Seats: String, Identifiable {
    var id: Seats { self }
    case inZone1 = "Zone 1"
    case inZone2 = "Zone 2"
    case inZone3 = "Zone 3"
    case inZone4 = "Zone 4"
    case infants = "Infants"

    var maxNumber: Int {
        switch self {
        case .inZone1:
            return 21
        case .inZone2:
            return 27
        case .inZone3:
            return 177
        case .inZone4:
            return 110
        case .infants:
            return 22
        }
    }

    var message: String {
        switch self{
        case .inZone1:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone2:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone3:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .inZone4:
            return """
                    Too many pax.
                    There are \(self.maxNumber) seats in this zone.
                    """
        case .infants:
            return """
                    There are too many infants on board.

                    """
        }
    }
}


//MARK: - Class Pax
class Pax: ObservableObject, Equatable {

    static func == (lhs: Pax, rhs: Pax) -> Bool {
        lhs.id == rhs.id
    }

    var id = UUID() // needed to differntiate with abstracted code
    var maleStringNumber = ""
    var femaleStringNumber = ""
    var childrenStringNumber = ""
    @Published var infantStringNumber = "" {
        didSet {
            if infantStringNumber != "" {
                addedInfant = true
            }
        }
    }
    var paxInCabin: CabinOccupency = .empty
    var hasMalesInZone = false
    var hasFemalesInZone = false
    var hasChildrenInZone = false
    var hasInfantsInZone = false
    var hasPeopleInZone = false
    var hideKeyboard = true
    @Published var addedInfant = false


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
        objectWillChange.send()
       return males * PaxWeight.jMale.weight
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
    func applyCabinLogic(_ paxCarried: CabinOccupency) {
        switch paxCarried {
        case .empty:
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
        objectWillChange.send()
        if hasMalesInZone || hasFemalesInZone || hasChildrenInZone || hasInfantsInZone {
            return true
        } else {
            return false
        }
    }

    static var example = Pax()

}
//MARK:- Class Cabin
class Cabin: ObservableObject {

    @Published var zone1 = Pax()
    @Published var zone2 = Pax()
    @Published var zone3 = Pax()
    @Published var zone4 = Pax()
    @Published var cabinCrew = CabinCrew.zero
    @Published var jWeight: JWeightConfiguration = .buisness
    @Published var seatingError: Seats? = nil
    @Published var zone1Unlocked = true
    @Published var zone2Unlocked = true
    @Published var zone3Unlocked = true
    @Published var zone4Unlocked = true
    @Published var jumpseat: Jumpseat = .none
    @Published var reduceInfantMaxNumber = 0
    @Published var moveCabinCrew = false {
        didSet { // Set to same zone so no weight adjustment
            if moveCabinCrew == false {
                moveFrom = .L2
                moveTo = .L2
            }
        }
    }
    @Published var moveFrom = CrewMoveFrom.L2
    @Published var moveTo = CrewMoveTo.L2

    var hasPax: Bool {
        if (zone1.hasPaxInZone || zone2.hasPaxInZone || zone3.hasPaxInZone || zone4.hasPaxInZone) {
            return true
        } else {
            return false
        }
    }
    //MARK: - Pax Zone Weight Calculations

    var totalPaxWeight: Int {
        zone1.buisnessWeight
            + zone1.ecconomyWeight
            + zone2.ecconomyWeight
            + zone3.ecconomyWeight
            + zone4.ecconomyWeight
    }

// To allow abstracted generic labels in J and Y models to display weights
    func zoneBuisnessWeight(for zone: Pax) -> Int {
        zone.buisnessWeight
    }

    func zoneEcconomylWeight(for zone: Pax) -> Int {
        zone.ecconomyWeight
    }
    // MARK:- POB Number Calulation

    var totalPaxNumbers: Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }

    func totalPax() -> Int {
        zone1.totalPax + zone2.totalPax + zone3.totalPax + zone4.totalPax
    }

    func totalInfantNumbers() -> Int {
        zone1.infants + zone2.infants + zone3.infants + zone4.infants
    }

    var totalInfants: Int {

        let total = zone1.infants + zone2.infants + zone3.infants + zone4.infants
        return total
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
            return Seats.infants.maxNumber
        case 333:
            return Seats.infants.maxNumber - 1
        case 334:
            return Seats.infants.maxNumber - 2
        case 335:
            return Seats.infants.maxNumber - 3
        default:
            return Seats.infants.maxNumber
        }
    }

    var cabinCrewNumber: Int {
        Int(cabinCrew.rawValue) ?? 0
    }

    var jumpseatNumber: Int {
        Int(jumpseat.rawValue) ?? 0
    }

    var totalCrewNumber: Int {
        cabinCrewNumber + jumpseatNumber + 2
    }
    var totalPOB: Int {
        totalPaxNumbers + totalCrewNumber
    }



// MARK: - Seating Logic

    func validPaxLoad(_ seats: Int) {
        // If over seating in a zone occurs, no other inputs are available until the seating issue is rectified.
        seatingError = nil

        if zone1.seatedPax > Seats.inZone1.maxNumber {
           seatingError = .inZone1
        }

        if zone2.seatedPax > Seats.inZone2.maxNumber {
            seatingError = .inZone2
        }

        if zone3.seatedPax > Seats.inZone3.maxNumber {
            seatingError = .inZone3
        }

        if zone4.seatedPax > Seats.inZone4.maxNumber {
            seatingError = .inZone4
        }

        if totalInfants > permittedInfantNumber {
          seatingError = .infants
        }
        
// Disable other zones until the seating error is corrected in the current zone. Infants are across all zones, that requires a Bool in the Pax class see infant has changed.
        zone1Unlocked = (
            seatingError == .inZone1
                || seatingError == .none
                || seatingError == .infants
                && zone1.addedInfant)
            ? true : false

        zone2Unlocked = (
            seatingError == .inZone2
                || seatingError == .none
                || seatingError == .infants
                && zone2.addedInfant)
            ? true : false

        zone3Unlocked = (
            seatingError == .inZone3
                || seatingError == .none
                || seatingError == .infants
                && zone3.addedInfant)
            ? true : false

        zone4Unlocked = (
            seatingError == .inZone4
                || seatingError == .none
                || seatingError == .infants
                && zone4.addedInfant)
            ? true : false
        if seatingError == .none {
            zone1.addedInfant = false
            zone2.addedInfant = false
            zone3.addedInfant = false
            zone4.addedInfant = false
        }
    }

    // MARK: - Seating Error Messages

    var zoneTitle: String {
        switch seatingError {
        case .inZone1:
            return Seats.inZone1.rawValue
        case .inZone2:
            return Seats.inZone2.rawValue
        case .inZone3:
            return Seats.inZone3.rawValue
        case .inZone4:
            return Seats.inZone4.rawValue
        case .infants:
            return Seats.infants.rawValue
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
        case .inZone1:
            return Seats.inZone1.message + " Remove \(zone1.seatedPax - Seats.inZone1.maxNumber) pax"
        case .inZone2:
            return Seats.inZone2.message + " Remove \(zone2.seatedPax - Seats.inZone2.maxNumber) pax"
        case .inZone3:
            return Seats.inZone3.message + " Remove \(zone3.seatedPax - Seats.inZone3.maxNumber) pax"
        case .inZone4:
            return Seats.inZone4.message + " Remove \(zone4.seatedPax - Seats.inZone4.maxNumber) pax"
        case .infants:
            return Seats.infants.message + infantGrammar
        case .none:
            return ""
        }
    }

static var example = Pax()

    //MARK:- Cabin Reset
    func resetCabin() {
        withAnimation {
        zone1 = Pax.init()
        zone2 = Pax.init()
        zone3 = Pax.init()
        zone4 = Pax.init()
        }
    }

}

