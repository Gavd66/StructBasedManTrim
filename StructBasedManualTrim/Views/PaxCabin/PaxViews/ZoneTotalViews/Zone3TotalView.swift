//
//  Zone3TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone3TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Zone 3 Total Weight")
                    .italic()
                    .bold()
                Spacer()
            }
            Text("\(cabin.zone3TotalWeight) kg")
                .capsuleStyle()

        }
    }
}

struct Zone3TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone3TotalView()
    }
}
