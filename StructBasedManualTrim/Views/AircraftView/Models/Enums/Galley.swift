//
//  Galley.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

    enum GalleyConfiguration: String, CaseIterable, Identifiable {
        var id: GalleyConfiguration { self }
        case full = "Full"
        case dom = "Domestic"
        case empty = "Empty"
        case nilCarts = "Nil Carts"


    }

