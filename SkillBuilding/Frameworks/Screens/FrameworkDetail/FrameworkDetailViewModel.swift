//
//  FrameworkDetailViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/17/23.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    let framework: Framework
    @Published var isShowingSafariView = false

    init(framework: Framework) {
        self.framework = framework
    }
}
