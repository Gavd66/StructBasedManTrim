//
//  Water.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

enum PotableWater: String, Identifiable, CaseIterable {
    var id: PotableWater { self }
    case from284Litres = "36 to 100% Full"
    case under284Litres = "Under 36% Full"

    var amount: (weight: Int, indexUnit: Double) {
        switch self {
        case .from284Litres:
            return (0,0)
        case .under284Litres:
            return (-284, -1.1)
        }
    }
}
