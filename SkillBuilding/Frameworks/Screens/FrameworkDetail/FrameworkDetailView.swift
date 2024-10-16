//
//  FrameworkDetailView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/16/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    @ObservedObject var viewModel: FrameworkDetailViewModel

    var body: some View {
        VStack {

            FrameworkTitleView(framework: viewModel.framework)
            Text(viewModel.framework.description)
                .font(.body)
                .padding()

            Spacer()

            if let url = URL(string: viewModel.framework.urlString) {
                Link("Learn More", destination: url)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .buttonBorderShape(.capsule)
                    .tint(.red)
                    .fontWeight(.semibold)
            }

//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
////                AFButton(title: "Learn More")
//                Label("Learn More", systemImage: "book.fill")
//            }
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .buttonBorderShape(.capsule)
//            .tint(.red)
//            .fontWeight(.semibold)
        }
//        .sheet(isPresented: $viewModel.isShowingSafariView) {
//            if let url = URL(string: viewModel.framework.urlString) {
//                SafariView(url: url)
//            }
//        }
    }
}

#Preview {
    FrameworkDetailView(viewModel: .init(framework: MockData.sampleFramework))
}
