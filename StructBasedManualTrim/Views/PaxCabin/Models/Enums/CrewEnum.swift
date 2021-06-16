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
}

enum CrewMoveTo: String, Identifiable, CaseIterable {
    var id: CrewMoveTo { self }
    case L1 = "L1 (A1)"
    case L2 = "L2 (A3)"
    case L3 = "L3 (A5)"
    case L4 = "L4 (A7)"
    case R1 = "R1 (A2)"
    case R2 = "R2 (A4)"
    case R3 = "R3 (A6)"
    case R4 = "R4 (A8)"
    case L1assist = "A9"
    case R4assist = "A11"
    case L4assist = "A10"
    case zone1 = "Zone 1"
    case zone2 = "Zone 2"
    case zone3 = "Zone 3"
    case zone4 = "Zone 4"
}

enum CrewMoveFrom: String, Identifiable, CaseIterable {
    var id: CrewMoveFrom { self }
    case L1 = "L1 (A1)"
    case L2 = "L2 (A3)"
    case L3 = "L3 (A5)"
    case L4 = "L4 (A7)"
    case R1 = "R1 (A2)"
    case R2 = "R2 (A4)"
    case R3 = "R3 (A6)"
    case R4 = "R4 (A8)"
    case L1assist = "A9"
    case R4assist = "A11"
    case L4assist = "A10"
}


//MARK: Enum Jumpseat Configuration

enum Jumpseat: String, Identifiable, CaseIterable {
    var id: Jumpseat { self }
    case none = "0"
    case one = "1"
    case two = "2"

    func dismissKeyboard() {
        
    }
}
