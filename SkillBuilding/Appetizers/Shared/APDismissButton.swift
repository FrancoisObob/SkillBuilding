//
//  APDismissButton.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import SwiftUI

struct APDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
                .padding(10)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    APDismissButton()
}
