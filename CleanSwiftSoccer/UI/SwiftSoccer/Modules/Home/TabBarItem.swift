//
//  TabBarItem.swift
//  SwiftSoccer
//
//  Created by Consultant on 22/09/2022.
//

import SwiftUI
import Presentation

/// Display an item for the home tab.
struct TabBarItem: View {
    // MARK: - Internal Properties
    /// The binded tab selected by user when button is triggered.
    @Binding var selectedTab: HomePageType
    /// The current tab.
    var tab: HomePageType

    // MARK: - Private Properties
    @Namespace private var namespace

    // MARK: - UI
    var body: some View {
        Button {
            self.selectedTab = tab
        } label: {
            HStack(alignment: .center) {
                Spacer()
                VStack {
                    HStack {
                        Image(tab.imageName)
                            .resizable()
                            .frame(width: 16,
                                   height: 16)
                        Text(tab.title)
                            .font(.callout)
                            .foregroundColor(.white)
                    }
                    if selectedTab == tab {
                        Color.white
                            .frame(height: 1.0)
                            .matchedGeometryEffect(id: "underline",
                                                   in: namespace,
                                                   properties: .frame)

                    } else {
                        Color.clear.frame(height: 1.0)
                    }
                }
                Spacer()

            }

        }.frame(height: 24)
            .buttonStyle(.plain)
    }
}
