//
//  APCaracteristic.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import SwiftUI

struct APCaracteristic: View {
    let name: String
    let value: Int

    var body: some View {
        VStack(spacing: 5) {
            Text(name)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    APCaracteristic(name: "Name", value: 123)
}
