//
//  JumpseatView.swift
//  StructBasedManualTrim
//
//  Created by Gavin Dorward on 15/6/21.
//

import SwiftUI

struct JumpseatView: View {

    @EnvironmentObject var cabin: Cabin

    var body: some View {
        Picker("Jumpseat", selection: $cabin.jumpseat.animation(), content: {
            ForEach(Jumpseat.allCases, id:\.self){
                Text("\($0.rawValue)")
            }
            .onChange(of: cabin.jumpseat, perform: dismissKeyboard)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
    // Required to prevent bug of blacked out keyboard area on change
    func dismissKeyboard(_ jumpseat: Jumpseat) {
        hideKeyboard()
    }
}

struct JumpseatView_Previews: PreviewProvider {
    static var previews: some View {
        JumpseatView()
    }
}
