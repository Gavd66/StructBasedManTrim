//
//  Zone2TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone2TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Zone 2 Total Weight")
                    .italic()
                    .bold()
                Spacer()
            }
            Text("\(cabin.zone2TotalWeight) kg")
                .capsuleStyle()

        }
    }
}

struct Zone2TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone2TotalView()
    }
}
