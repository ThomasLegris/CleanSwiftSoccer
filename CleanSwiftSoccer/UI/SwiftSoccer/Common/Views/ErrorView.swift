//
//  ErrorView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI

/// Common error view.
struct ErrorView: View {
    // MARK: - UI
    var body: some View {
        // TODO: Implement an common error view
        // Title + "red card" icon ?
        Text(L10n.commonError)
    }
}

// MARK: - Preview
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
