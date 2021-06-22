//
//  Galley.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

    enum GalleyConfiguration: String, CaseIterable, Identifiable {
        var id: GalleyConfiguration { self }
       // case full = "Full Cater" Currently not avialable
        case dom = "Domestic"
        case empty = "Nil Cater"
        case nilCarts = "No Carts"

        var details:(weight: Int, indexUnit: Double) {
            switch self {
            case .dom:
                return (0,0)
            case .empty:
                return (-871, -0.3)
            case .nilCarts:
                return (-1398, -0.4)
            }
        }
    }

