//
//  CrewCabinIndexUnit.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 16/6/21.
//

import Foundation
import SwiftUI

struct ZoneIndexUnit {

    //MARK:- Zone1
    func zone1(using weight: Int) -> Double {
        switch weight {
        case 1...99:
            return -1.2
        case 100...199:
            return -0.5
        case 200...299:
            return -0.8
        case 300...399:
            return -1.2
        case 400...499:
            return -1.5
        case 500...599:
            return -1.8
        case 600...699:
            return -2.2
        case 700...799:
            return -2.5
        case 800...899:
            return -2.8
        case 900...999:
            return -3.2
        case 1000...1099:
            return -3.5
        case 1100...1199:
            return -3.8
        case 1200...1299:
            return -4.2
        case 1300...1399:
            return -4.5
        case 1400...1499:
            return -4.8
        case 1500...1599:
            return -5.2
        case 1600...1699:
            return -5.5
        case 1700...1799:
            return -5.8
        case 1800...1899:
            return -6.2
        case 1900...1999:
            return -6.5
        case 2000...2099:
            return -6.8
        case 2100...2121:
            return -7.0

        default:
            return 3.0
        }
    }
    // MARK:- Zone 2
    func zone2(using weight: Int) -> Double {
        switch weight {
        case 1...149:
            return -0.2
        case 150...299:
            return -0.6
        case 300...449:
            return -1.0
        case 450...599:
            return -1.4
        case 600...749:
            return -1.8
        case 750...899:
            return -2.2
        case 900...1049:
            return -2.6
        case 1050...1199:
            return -3.0
        case 1200...1349:
            return -3.4
        case 1350...1499:
            return -3.8
        case 1500...1649:
            return -4.2
        case 1650...1799:
            return -4.6
        case 1800...1949:
            return -5.0
        case 1950...2099:
            return -5.4
        case 2100...2249:
            return -5.8
        case 2250...2399:
            return -6.2
        case 2400...2457:
            return -6.5
        default:
            return 0.0
        }
    }

    //MARK:- Zone 3
    func zone3(using weight: Int) -> Double {
        switch weight {
        case 1...699:
            return -0.2
        case 700...1399:
            return -0.5
        case 1400...2099:
            return -0.8
        case 2100...2799:
            return -1.1
        case 2800...3499:
            return -1.4
        case 3500...4199:
            return -1.7
        case 4200...4899:
            return -2.0
        case 4900...5599:
            return -2.4
        case 5600...6299:
            return -2.7
        case 6300...6999:
            return -3.0
        case 7000...7699:
            return -3.3
        case 7700...8399:
            return -3.6
        case 8400...9099:
            return -3.9
        case 9100...9799:
            return -4.2
        case 9800...10499:
            return -4.6
        case 10500...11199:
            return -4.9
        case 11200...11899:
            return -5.2
        case 11900...12599:
            return -5.5
        case 12600...13299:
            return -5.8
        case 13300...13999:
            return -6.1
        case 14000...14699:
            return -6.4
        case 14700...15399:
            return -6.7
        case 15400...16107:
            return -7.1
        default:
            return 0.0
        }
    }

    // MARK:- Zone 4
    func zone4(using weight: Int) -> Double {
        switch weight {
        case 1...299:
            return 0.3
        case 300...599:
            return 1.0
        case 600...899:
            return 1.7
        case 900...1199:
            return 2.4
        case 1200...1499:
            return 3.1
        case 1500...1799:
            return 3.8
        case 1800...2099:
            return 4.5
        case 2100...2399:
            return 5.2
        case 2400...2699:
            return 5.9
        case 2700...2999:
            return 6.6
        case 3000...3299:
            return 7.3
        case 3300...3599:
            return 8.0
        case 3600...3899:
            return 8.7
        case 3900...4199:
            return 9.4
        case 4200...4499:
            return 10.1
        case 4500...4799:
            return 10.8
        case 4800...5099:
            return 11.5
        case 5100...5399:
            return 12.2
        case 5400...5699:
            return 12.9
        case 5700...5999:
            return 13.6
        case 6000...6299:
            return 14.3
        case 6300...6599:
            return 15.0
        case 6600...6899:
            return 15.7
        case 6900...7199:
            return 16.4
        case 7200...7499:
            return 17.1
        case 7500...7799:
            return 17.8
        case 7800...8099:
            return 18.5
        case 8100...8399:
            return 19.2
        case 8400...8699:
            return 19.9
        case 8700...8999:
            return 20.6
        case 9000...9299:
            return 21.3
        case 9300...9599:
            return 22.0
        case 9600...9899:
            return 22.7
        case 9900...10010:
            return 23.2
        default:
            return 0.0
        }
    }
}




