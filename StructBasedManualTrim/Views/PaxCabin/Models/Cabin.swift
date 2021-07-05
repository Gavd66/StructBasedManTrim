//
//  Cabin.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 28/6/21.
//

import Foundation
import SwiftUI

//MARK:- Class Cabin
class Cabin: ObservableObject {

    // Create an instance for each zone
    @Published var zone1 = Pax()
    @Published var zone2 = Pax()
    @Published var zone3 = Pax()
    @Published var zone4 = Pax()
    @Published var jumpseat: Jumpseat = .none
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
    @Published var extraSeatAdjustment = false {
        didSet {
            if extraSeatAdjustment == false {
                instrumentOnSeat = false
                serviceDogInCabin = false
                oversizePaxInCabin = false
            }
        }
    }
    @Published var instrument = Instrument.one
    @Published var instrumentOnSeat = false {
        didSet {
            if instrumentOnSeat == false {
                instrument = .one
            }
        }
    }
    @Published var serviceDogInCabin = false {
        didSet {
            if serviceDogInCabin == false {
                zone1.hasServiceDogInZone = false
                zone2.hasServiceDogInZone = false
                zone3.hasServiceDogInZone = false
                zone4.hasServiceDogInZone = false
            }
        }
    }
    @Published var oversizePaxInCabin = false {
        didSet {
            if oversizePaxInCabin == false {
                zone1.hasOversizePaxInZone = false
                zone2.hasOversizePaxInZone = false
                zone3.hasOversizePaxInZone = false
                zone4.hasOversizePaxInZone = false
            }
        }
    }
    @Published var jWeight: JWeightConfiguration = .buisness
    // To display the alert for errors
    @Published var seatingError: SeatingLogic?
    var paxToRemove = 0
    var infantZone = InfantZone.zone1 // To determine zone that infant is in

    // To determine if there are any pax onboard
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
    //MARK: - Pax Zone Weight

    var zone1Weight: Int {
        switch jWeight {
        case .buisness:
            return zone1.buisnessWeight
        case .ecconomy:
            return zone1.ecconomyWeight
        }
    }

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

    // MARK:- Weight Index Units


    // MARK: Zones
    let indexUnit = ZoneIndexUnit()
    var indexUnitZone1: Double {
        switch jWeight {
        case .buisness:
            return indexUnit.forZone1(using: zone1.buisnessWeight)
        case .ecconomy:
            return indexUnit.forZone1(using: zone1.ecconomyWeight)
        }
    }
    var indexUnitZone2: Double {
        indexUnit.forZone2(using: zone2.ecconomyWeight)
    }

    var indexUnitZone3: Double {
        indexUnit.forZone3(using: zone3.ecconomyWeight)
    }

    var indexUnitZone4: Double {
        indexUnit.forZone4(using: zone4.ecconomyWeight)
    }

    var totalPaxIndexUnit: Double {
        return indexUnitZone1
            + indexUnitZone2
            + indexUnitZone3
            + indexUnitZone4
    }

    // MARK: Cabin Crew Shift
    var cabinCrewShift: (weight: Int, indexUnit: Double) {
        let weight = moveFrom.position.weight
            + moveTo.position.weight
        let indexUnit = moveFrom.position.indexUnit
            + moveTo.position.indexUnit

        return (weight, indexUnit)
    }

    // MARK: Instrument

    var instrumentNumber: (weight: Int, indexUnit: Double) {
        if instrumentOnSeat == true {
            return (instrument.number.weight, instrument.number.indexUnit)
        } else {
            return (0,0)
        }

    }
    //MARK: Service Dog
    var serviceDogNumber: (weight: Int, indexUnit: Double) {

        // Add totals to return one adjustment
        var totalDogWeight = 0
        var totalDogIndexUnit = 0.0

        if zone1.hasServiceDogInZone {
            totalDogWeight += zone1.serviceDog.weight
            totalDogIndexUnit  += zone1.serviceDog.indexForZone1
        }
        if zone2.hasServiceDogInZone {
            totalDogWeight += zone2.serviceDog.weight
            totalDogIndexUnit += zone2.serviceDog.indexForZone2
        }
        if zone3.hasServiceDogInZone {
            totalDogWeight += zone3.serviceDog.weight
            totalDogIndexUnit += zone3.serviceDog.indexForZone3
        }
        if zone4.hasServiceDogInZone {
            totalDogWeight += zone4.serviceDog.weight
            totalDogIndexUnit += zone4.serviceDog.indexForZone4
        }
        return (totalDogWeight, totalDogIndexUnit)
    }
    // MARK: Oversize Pax
    var oversizePaxNumber: (weight: Int, indexUnit: Double) {

        // Add totals to return one adjustment
        var totalOversizePaxWeight = 0
        var totalOversizePaxIndexUnit = 0.0

        if zone1.hasOversizePaxInZone {
            totalOversizePaxWeight += zone1.oversizePax.weight
            totalOversizePaxIndexUnit += zone1.oversizePax.indexForZone1
        }
        if zone2.hasOversizePaxInZone {
            totalOversizePaxWeight += zone2.oversizePax.weight
            totalOversizePaxIndexUnit += zone2.oversizePax.indexForZone2
        }
        if zone3.hasOversizePaxInZone {
            totalOversizePaxWeight += zone3.oversizePax.weight
            totalOversizePaxIndexUnit += zone3.oversizePax.indexForZone3
        }
        if zone4.hasOversizePaxInZone{
            totalOversizePaxWeight += zone4.oversizePax.weight
            totalOversizePaxIndexUnit += zone4.oversizePax.indexForZone4
        }
        return (totalOversizePaxWeight, totalOversizePaxIndexUnit)
    }

    var crewAndExtraSeatAdjustment:(weight: Int, indexUnit: Double) {
        let weight = jumpseat.numbers.weight
            + cabinCrew.numbers.weight
            + cabinCrewShift.weight
            + instrumentNumber.weight
            + serviceDogNumber.weight
            + oversizePaxNumber.weight

        let indexUnit = jumpseat.numbers.indexUnit
            + cabinCrew.numbers.indexUnit
            + cabinCrewShift.indexUnit
            + instrumentNumber.indexUnit
            + serviceDogNumber.indexUnit
            + oversizePaxNumber.indexUnit

        return (weight, indexUnit)

    }

    var totalAdjustment:(weight: Int, indexUnit: Double) {
        let weight = crewAndExtraSeatAdjustment.weight
            + totalPaxWeight

        let indexUnit =  crewAndExtraSeatAdjustment.indexUnit
            + totalPaxIndexUnit

        return (weight, indexUnit)
    }

    // MARK: - Seating Logic

    func validatePaxLoad(_ seats: Int) {
        // If over seating in a zone occurs, the input is removed.
        seatingError = nil
        if totalPaxNumbers != 0 && cabinCrew.number == 0 {
            seatingError = .noCabinCrew
        }

        if zone1.seatedPax > SeatingLogic.forZone1.maxNumber {
            seatingError = .forZone1
            paxToRemove = zone1.seatedPax - SeatingLogic.forZone1.maxNumber
        }

        if zone2.seatedPax > SeatingLogic.forZone2.maxNumber {
            seatingError = .forZone2
            paxToRemove = zone2.seatedPax - SeatingLogic.forZone2.maxNumber
        }

        if zone3.seatedPax > SeatingLogic.forZone3.maxNumber {
            seatingError = .forZone3
            paxToRemove = zone2.seatedPax - SeatingLogic.forZone2.maxNumber
        }

        if zone4.seatedPax > SeatingLogic.forZone4.maxNumber {
            seatingError = .forZone4
            paxToRemove = zone4.seatedPax - SeatingLogic.forZone4.maxNumber
        }

        if totalInfants > permittedInfantNumber {
            if seats == zone1.totalPax {
                infantZone = .zone1
            }
            if seats == zone2.totalPax {
                infantZone = .zone2
            }
            if seats == zone3.totalPax {
                infantZone = .zone3
            }
            if seats == zone4.totalPax {
                infantZone = .zone4
            }
            seatingError = .forInfants
            paxToRemove = totalInfants - SeatingLogic.forInfants.maxNumber
        }
    }

    // Animate the removal of the entry that created the error
    func removeLastEntry(for seatingError: SeatingLogic) {
        // Remove the entry that caused the seating error condition
        switch seatingError {
        case .forZone1:
            removeLastInput(for: zone1)
        case .forZone2:
            removeLastInput(for: zone2)
        case .forZone3:
            removeLastInput(for: zone3)
        case .forZone4:
            removeLastInput(for: zone4)
        case .forInfants:
            switch infantZone {
            case .zone1:
                removeLastInput(for: zone1)
            case .zone2:
                removeLastInput(for: zone2)
            case .zone3:
                removeLastInput(for: zone3)
            case .zone4:
                removeLastInput(for: zone4)
            }
        case .noCabinCrew:
            removeLastInput(for: zone1)
            removeLastInput(for: zone2)
            removeLastInput(for: zone3)
            removeLastInput(for: zone4)
        }
    }

    func removeLastInput(for zone: Pax) {
        switch zone.lastSelection {
        case .male:
            withAnimation {
                zone.maleStringNumber = ""
            }
        case .female:
            withAnimation {
                zone.femaleStringNumber = ""
            }
        case .child:
            withAnimation {
                zone.childStringNumber = ""
            }
        case .infant:
            withAnimation {
                zone.infantStringNumber = ""
            }
        }
    }

    var passenger: String {
        switch seatingError {
        case .forZone1:
            return zone1.lastSelection.rawValue
        case .forZone2:
            return zone2.lastSelection.rawValue
        case .forZone3:
            return zone3.lastSelection.rawValue
        case .forZone4:
            return zone3.lastSelection.rawValue
        case .forInfants:
            return "Infants"
        case .noCabinCrew:
            return "All passengers"
        case .none:
            return ""
        }
    }

    var message: String {
        let message = seatingError?.message ?? ""
        switch seatingError {
        case .forZone1:
            fallthrough
        case .forZone2:
            fallthrough
        case .forZone3:
            fallthrough
        case .forZone4:
            return message + " by \(paxToRemove)."
        case .forInfants:
            return message + " by \(paxToRemove). Infants for this zone will be removed."
        case .noCabinCrew:
            return message
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
            extraSeatAdjustment = false
            moveCabinCrew = false
        }
    }
}

