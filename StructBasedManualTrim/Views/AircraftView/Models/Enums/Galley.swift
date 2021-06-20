//
//  Galley.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

    enum GalleyConfiguration: String, CaseIterable, Identifiable {
        var id: GalleyConfiguration { self }
        case full = "Full Cater"
        case dom = "Domestic"
        case empty = "Nil Cater"
        case nilCarts = "No Carts"


    }

