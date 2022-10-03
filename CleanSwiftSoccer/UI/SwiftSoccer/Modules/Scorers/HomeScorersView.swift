//
//  HomeScorersView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS on 23/03/2022.
//

import SwiftUI
import Combine
import Domain
import Presentation

/// Display list of scorer for a selected league.
struct HomeScorersView: View {
    // MARK: - Internal Properties
    @ObservedObject var interactor: HomeScorersInteractor
    
    // MARK: - UI
    var body: some View {
        List {
            Section {
                ForEach(interactor.topScorers, id: \.playerId) { scorer in
                    ScorersListRow(model: scorer)
                }
            } header: {
                ScorersListHeader()
            }
        }
        .background(Color("homeBackgroundColor")).ignoresSafeArea()
        .listStyle(.inset)
    }
}

// MARK: - Preview
struct HomeScorersView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScorersView(interactor: DIContainer.shared.homeScorersInteractor(selectedLeague: .ligue1))
    }
}
