//
//  Zone1TotalView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 11/6/21.
//

import SwiftUI

struct Zone1TotalView: View {
    @EnvironmentObject var cabin: Cabin
    var body: some View {

        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Zone 1 Total Weight")
                    .italic()
                    .bold()
                Spacer()
            }
            Text("\(cabin.zone1TotalWeight) kg")
                .capsuleStyle()
            
        }
    }
}

struct Zone1TotalView_Previews: PreviewProvider {
    static var previews: some View {
        Zone1TotalView()
    }
}
