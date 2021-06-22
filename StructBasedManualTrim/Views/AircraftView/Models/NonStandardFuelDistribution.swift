//
//  NonStandardFuelDistribution.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 21/6/21.
//

import Foundation

struct NonStandardFuelDistribution {

    var message: Bool

    func forLeftTank(using leftTank: Int) -> (weight: Int, indexUnit: Double) {
        // if fuelInCentreMessage, make no adjustments to wingTank, if it is subtract 200 kg

        var wingTank = 0
        wingTank = (message) ? leftTank :  leftTank - 200

        switch wingTank {
        case 1...999:
            return (wingTank, 0.0)
        case 1000...1999:
            return (wingTank, 0.1)
        case 2000...2999:
            return (wingTank, 0.2)
        case 3000...3999:
            return (wingTank, 0.3)
        case 4000...4999:
            return (wingTank, 0.4)
        case 5000...5999:
            return (wingTank, 0.5)
        case 6000...6999:
            return (wingTank, 0.6)
        case 7000...7999:
            return (wingTank, 0.7)
        case 8000...8999:
            return (wingTank, 0.9)
        case 9000...9999:
            return (wingTank, 1.1)
        case 10000...10999:
            return (wingTank, 1.4)
        case 11000...11499:
            return (wingTank, 1.6)
        case 11500...11999:
            return (wingTank, 1.8)
        case 12000...12499:
            return (wingTank, 2.1)
        case 12500...12999:
            return (wingTank, 2.3)
        case 13000...13199:
            return (wingTank, 2.5)
        case 13200...13399:
            return (wingTank, 2.6)
        case 13400...13599:
            return (wingTank, 2.8)
        case 13600...13799:
            return (wingTank, 2.9)
        case 13800...13999:
            return (wingTank, 3.0)
        case 14000...14199:
            return (wingTank, 3.2)
        case 14200...14399:
            return (wingTank, 3.3)
        case 14400...14599:
            return (wingTank, 3.5)
        case 14600...14799:
            return (wingTank, 3.6)
        case 14800...14999:
            return (wingTank, 3.8)
        case 15000...15199:
            return (wingTank, 4.0)
        case 15200...15399:
            return (wingTank, 4.1)
        case 15400...15599:
            return (wingTank, 4.3)
        case 15600...15799:
            return (wingTank, 4.5)
        case 15800...15999:
            return (wingTank, 4.7)
        case 16000...16199:
            return (wingTank, 4.9)
        case 16200...16399:
            return (wingTank, 5.1)
        case 16400...16599:
            return (wingTank, 5.4)
        case 16600...16799:
            return (wingTank, 5.6)
        case 16800...17026:
            return (wingTank, 5.8)
        case 17027...17711:
            return (wingTank, 6.1)
        default:
            return(0,0)
        }

    }

    func forCentreTank(using centreTank: Int) -> (weight: Int, indexUnit: Double) {
        var mainTank = 0
        // If fuelInCentreMessage taxiFuel is removed from centre tank
        mainTank = (message) ? centreTank - 400 : centreTank
        switch mainTank {
        case 1...999:
            return (mainTank, -0.2)
        case 1000...1999:
            return (mainTank, -0.5)
        case 2000...2999:
            return (mainTank, -0.9)
        case 3000...3999:
            return (mainTank, -1.2)
        case 4000...4999:
            return (mainTank, -1.6)
        case 5000...5999:
            return (mainTank, -2.1)
        case 6000...6999:
            return (mainTank, -2.5)
        case 7000...7999:
            return (mainTank, -3.0)
        case 8000...8999:
            return (mainTank, -3.5)
        case 9000...9999:
            return (mainTank, -4.0)
        case 10000...10999:
            return (mainTank, -4.5)
        case 11000...11999:
            return (mainTank, -5.0)
        case 12000...12999:
            return (mainTank, -5.4)
        case 13000...13999:
            return (mainTank, -5.9)
        case 14000...14999:
            return (mainTank, -6.4)
        case 15000...15999:
            return (mainTank, -6.9)
        case 16000...16999:
            return (mainTank, -7.4)
        case 17000...17999:
            return (mainTank, -7.8)
        case 18000...18999:
            return (mainTank, -8.3)
        case 19000...19999:
            return (mainTank, -8.8)
        case 20000...20999:
            return (mainTank, -9.2)
        case 21000...21999:
            return (mainTank, -9.7)
        case 22000...22999:
            return (mainTank, -10.1)
        case 23000...23999:
            return (mainTank, -10.6)
        case 24000...24999:
            return (mainTank, -11.0)
        case 25000...25999:
            return (mainTank, -11.5)
        case 26000...26999:
            return (mainTank, -11.9)
        case 27000...27999:
            return (mainTank, -12.4)
        case 28000...28999:
            return (mainTank, -12.8)
        case 29000...29999:
            return (mainTank, -13.3)
        case 30000...30999:
            return (mainTank, -13.7)
        case 31000...31999:
            return (mainTank, -14.1)
        case 32000...32999:
            return (mainTank, -14.6)
        case 33000...33999:
            return (mainTank, -15.0)
        case 34000...34999:
            return (mainTank, -15.4)
        case 35000...35999:
            return (mainTank, -15.9)
        case 36000...36999:
            return (mainTank, -16.3)
        case 37000...37999:
            return (mainTank, -16.7)
        case 38000...38999:
            return (mainTank, -17.2)
        case 39000...39999:
            return (mainTank, -17.6)
        case 40000...40999:
            return (mainTank, -18.0)
        case 41000...41999:
            return (mainTank, -18.4)
        case 42000...42999:
            return (mainTank, -18.9)
        case 43000...43999:
            return (mainTank, -19.3)
        case 44000...44999:
            return (mainTank, -19.7)
        case 45000...45999:
            return (mainTank, -20.2)
        case 46000...46999:
            return (mainTank, -20.6)
        case 47000...47999:
            return (mainTank, -21.0)
        case 48000...48999:
            return (mainTank, -21.4)
        case 49000...49999:
            return (mainTank, -21.8)
        case 50000...50999:
            return (mainTank, -22.3)
        case 51000...51999:
            return (mainTank, -22.7)
        case 52000...52999:
            return (mainTank, -23.2)
        case 53000...53999:
            return (mainTank, -23.6)
        case 54000...54999:
            return (mainTank, -24.1)
        case 55000...55999:
            return (mainTank, -24.5)
        case 56000...56999:
            return (mainTank, -25.0)
        case 57000...57999:
            return (mainTank, -25.4)
        case 58000...58999:
            return (mainTank, -25.9)
        case 59000...59999:
            return (mainTank, -26.3)
        case 60000...60999:
            return (mainTank, -26.8)
        case 61000...61999:
            return (mainTank, -27.2)
        case 62000...62999:
            return (mainTank, -27.7)
        case 63000...63999:
            return (mainTank, -28.2)
        case 64000...64999:
            return (mainTank, -28.6)
        case 65000...65999:
            return (mainTank, -29.1)
        case 66000...66999:
            return (mainTank, -29.6)
        case 67000...67859:
            return (mainTank, -30.0)
        case 67860...705090:
            return (mainTank, -30.8)
        default:
            return(0,0)
        }


    }
    
    func forRightTank(using rightTank: Int) -> (weight: Int, indexUnit: Double) {
        var wingTank = 0
        wingTank = (message) ? rightTank :  rightTank - 200
        switch wingTank {
        case 1...999:
            return (wingTank, 0.0)
        case 1000...1999:
            return (wingTank, 0.1)
        case 2000...2999:
            return (wingTank, 0.2)
        case 3000...3999:
            return (wingTank, 0.3)
        case 4000...4999:
            return (wingTank, 0.4)
        case 5000...5999:
            return (wingTank, 0.5)
        case 6000...6999:
            return (wingTank, 0.6)
        case 7000...7999:
            return (wingTank, 0.7)
        case 8000...8999:
            return (wingTank, 0.9)
        case 9000...9999:
            return (wingTank, 1.1)
        case 10000...10999:
            return (wingTank, 1.4)
        case 11000...11499:
            return (wingTank, 1.6)
        case 11500...11999:
            return (wingTank, 1.8)
        case 12000...12499:
            return (wingTank, 2.1)
        case 12500...12999:
            return (wingTank, 2.3)
        case 13000...13199:
            return (wingTank, 2.5)
        case 13200...13399:
            return (wingTank, 2.6)
        case 13400...13599:
            return (wingTank, 2.8)
        case 13600...13799:
            return (wingTank, 2.9)
        case 13800...13999:
            return (wingTank, 3.0)
        case 14000...14199:
            return (wingTank, 3.2)
        case 14200...14399:
            return (wingTank, 3.3)
        case 14400...14599:
            return (wingTank, 3.5)
        case 14600...14799:
            return (wingTank, 3.6)
        case 14800...14999:
            return (wingTank, 3.8)
        case 15000...15199:
            return (wingTank, 4.0)
        case 15200...15399:
            return (wingTank, 4.1)
        case 15400...15599:
            return (wingTank, 4.3)
        case 15600...15799:
            return (wingTank, 4.5)
        case 15800...15999:
            return (wingTank, 4.7)
        case 16000...16199:
            return (wingTank, 4.9)
        case 16200...16399:
            return (wingTank, 5.1)
        case 16400...16599:
            return (wingTank, 5.4)
        case 16600...16799:
            return (wingTank, 5.6)
        case 16800...17026:
            return (wingTank, 5.8)
        case 17027...17711:
            return (wingTank, 6.1)
        default:
            return(0,0)
        }
    }
}



