//
//  HomeStandingView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Combine
import Presentation
import Domain

/// View to display the current season standing.
struct HomeStandingView: View {
    // MARK: - Internal Properties
    @ObservedObject var interactor: HomeStandingInteractor

    // MARK: - UI
    var body: some View {
        List {
            Section {
                ForEach(interactor.rankedTeams, id: \.position) { team in
                    StandingListRow(model: team)
                        .background(.clear)
                }
            } header: {
                StandingListHeader()
            }
        }
        .background(Color("homeBackgroundColor"))
        .ignoresSafeArea()
        .listStyle(.inset)
    }
}

// MARK: - Preview
struct HomeStandingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStandingView(interactor: DIContainer.shared.homeStandingInteractor(selectedLeague: .ligue1))
    }
}
