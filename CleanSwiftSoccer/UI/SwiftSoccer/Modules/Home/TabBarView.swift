//
//  TabBarView.swift
//  SwiftSoccer
//
//  Created by Consultant on 22/09/2022.
//

import SwiftUI
import Presentation

/// Tab bar view displayed on the home page bottom.
struct TabBarView: View {
    // MARK: - Internal Properties
    @Binding var selectedPage: HomePageType

    // MARK: - UI
    var body: some View {
        HStack(alignment: .center) {
            ForEach(HomePageType.allCases,
                    id: \.self) { tab in
                TabBarItem(selectedTab: $selectedPage,
                           tab: tab)
            }
        }
        .padding(8.0)
        .background(Color("red50"))
    }
}
