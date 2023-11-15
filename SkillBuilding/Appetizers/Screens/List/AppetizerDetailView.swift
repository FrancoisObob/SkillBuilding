//
//  AppetizerDetailView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import SwiftUI

struct AppetizerDetailView: View {

    @EnvironmentObject var order: Order

    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    APCaracteristic(name: "Calories", value: appetizer.calories)
                    APCaracteristic(name: "Carbs", value: appetizer.carbs)
                    APCaracteristic(name: "Protein", value: appetizer.protein)
                }
            }

            Spacer()

            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .standardButtonStyle()
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            APDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetail: .constant(true))
    .environmentObject(Order())
}
