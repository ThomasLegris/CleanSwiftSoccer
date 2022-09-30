//
//  StandingListHeader.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Domain

/// Header row for standing list.
struct StandingListHeader: View {
    // MARK: - UI
    var body: some View {
        StandingListRow(model: HomeStandingModel(teamId: 0,
                                                 teamName: L10n.standingClubs,
                                                 position: L10n.standingRank,
                                                 points: L10n.standingPoints,
                                                 teamIconName: "",
                                                 goalsInOut: L10n.standingGoalDiff,
                                                 backgroundColorName: "white80",
                                                 positionBackgroundColorName: nil,
                                                 positionTextColorName: "gray80"))
    }
}

// MARK: - Preview
struct StandingListHeader_Previews: PreviewProvider {
    static var previews: some View {
        StandingListHeader()
    }
}
