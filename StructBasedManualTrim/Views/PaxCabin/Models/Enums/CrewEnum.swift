//
//  Crew.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 15/6/21.
//

import Foundation
import SwiftUI
import UIKit

//MARK: Cabin Crew

enum CabinCrew: String, Identifiable, CaseIterable {
    var id: CabinCrew { self }
    case zero = "0"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"

    var number: Int {
        return Int(self.rawValue) ?? 0
    }
}

enum CrewMoveTo: String, Identifiable, CaseIterable {
    var id: CrewMoveTo { self }
    case A1 = "L1 (A1)"
    case A3 = "L2 (A3)"
    case A5 = "L3 (A5)"
    case A7 = "L4 (A7)"
    case A2 = "R1 (A2)"
    case A4 = "R2 (A4)"
    case A6 = "R3 (A6)"
    case A8 = "R4 (A8)"
    case A9 = "A9"
    case A11 = "A11"
    case A10 = "A10"
    case zone1 = "Zone 1"
    case zone2 = "Zone 2"
    case zone3 = "Zone 3"
    case zone4 = "Zone 4"
}

enum CrewMoveFrom: String, Identifiable, CaseIterable {
    var id: CrewMoveFrom { self }
    case A1 = "L1 (A1)"
    case A3 = "L2 (A3)"
    case A5 = "L3 (A5)"
    case A7 = "L4 (A7)"
    case A2 = "R1 (A2)"
    case A4 = "R2 (A4)"
    case A6 = "R3 (A6)"
    case A8 = "R4 (A8)"
    case A9 = "A9"
    case A11 = "A11"
    case A10 = "A10"
}


//MARK: Enum Jumpseat Configuration

enum Jumpseat: String, Identifiable, CaseIterable {
    var id: Jumpseat { self }
    case none = "0"
    case one = "1"
    case two = "2"

    var number: Int {
        Int(self.rawValue) ?? 0
    }


}
