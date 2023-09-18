//
//  FrameworkGridViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/16/23.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }

    @Published var isShowingDetailView = false

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}
