//
//  Zone4TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone4TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Zone 4 Total Weight")
                    .italic()
                    .bold()
                Spacer()
            }
            Text("\(cabin.zone4TotalWeight) kg")
                .capsuleStyle()

        }
    }
}

struct Zone4TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone4TotalView()
    }
}
