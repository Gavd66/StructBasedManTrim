//
//  Registration.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 17/6/21.
//

import Foundation

enum Registration: String, Identifiable, CaseIterable {
    var id: Registration { self }
    case vkg = "VH-VKG"
    case vkh = "VH-VKH"
    case vki = "VH-VKI"
    case vkj = "VH-VKJ"
    case vkl = "VH-VKL"
    case none = "No Selection"

    var details: (weight:Int, indexUnit: Double) {
        switch self {
        case .vkg:
            return (115841, 46.0)
        case .vkh:
            return (115730, 46.7)
        case .vki:
            return (115637, 46.3)
        case .vkj:
            return (115956, 47.6)
        case .vkl:
            return (116070, 47.1)
        case .none:
            return (0,0)
        }
    }
}
