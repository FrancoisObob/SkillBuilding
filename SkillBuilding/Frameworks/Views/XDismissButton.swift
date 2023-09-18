//
//  XDismissButton.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/18/23.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowingDetailView: Bool

    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    XDismissButton(isShowingDetailView: .constant(false))
}
