//
//  ScorersListHeader.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Domain

/// Header row for scorers list.
struct ScorersListHeader: View {
    var body: some View {
        ScorersListRow(model: HomeScorerModel(teamId: 0,
                                              teamName: "",
                                              teamIconName: "",
                                              playerId: 0,
                                              playerName: L10n.scorersName,
                                              position: "",
                                              goalsScored: L10n.scorersGoalsScored,
                                              matchesPlayed: L10n.scorersMatchesPlayed))
    }
}

struct ScorersListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScorersListHeader()
    }
}
