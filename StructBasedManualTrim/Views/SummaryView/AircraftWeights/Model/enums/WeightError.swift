//
//  WeightError.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 24/6/21.
//

import Foundation

enum WeightError: String, Identifiable, CaseIterable {
    var id: WeightError { self }
    case maxZeroFuelWeight = "Exceded Max ZFW"
    case maxTakeoffWeight = "Exceeded Max Takeoff weight"
}
