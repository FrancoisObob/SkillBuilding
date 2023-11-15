//
//  OrderView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/19/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                                .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, allowsFullSwipe: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                                    Button("Delete", role: .destructive) {
                                        order.remove(appetizer)
                                    }
                                }
                        }
                    }
                    .listStyle(.grouped)

                    Button {
                        print("tapped")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .standardButtonStyle()
                    .padding()
                }

                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "No order items founds")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
