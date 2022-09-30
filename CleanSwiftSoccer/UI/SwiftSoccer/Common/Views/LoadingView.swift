//
//  LoadingView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

/// Common loader.
struct LoadingView: View {
    var shouldShowLoader: Bool
    var title: String = "Loading"

    // MARK: - UI
    // TODO: Implement an progress view and display it when api call async task.
    var body: some View {
        if shouldShowLoader {
            ProgressView(self.title)
                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                .foregroundColor(Color("red50"))
        }
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(shouldShowLoader: true)
    }
}
