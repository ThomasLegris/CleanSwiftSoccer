//
//  CommonStatusView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Presentation

/// Common view which display error or loading.
struct CommonStatusView: View {
    // MARK: - Internal Properties
    var status: ViewStatus

    // MARK: - UI
    var body: some View {
        if status == .loading {
            LoadingView(shouldShowLoader: true)
        } else if status == .error {
            ErrorView()
        }
    }
}

// MARK: - Preview
struct CommonStatusView_Previews: PreviewProvider {
    static var previews: some View {
        CommonStatusView(status: .loading)
    }
}
