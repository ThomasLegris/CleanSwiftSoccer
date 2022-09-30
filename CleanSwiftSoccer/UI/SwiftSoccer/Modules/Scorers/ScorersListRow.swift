//
//  ScorersListRow.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Domain

/// Row for player in scorers list.
struct ScorersListRow: View {
    // MARK: - Internal Properties
    var model: HomeScorerModel

    // MARK: - UI
    var body: some View {
        HStack(spacing: 6.0) {
            Text(model.position)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("gray80"))
                .frame(width: 40.0)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(model.playerName)
                    .font(.caption)
                    .foregroundColor(Color("gray80"))
                if !model.teamName.isEmpty {
                    HStack(spacing: 4.0) {
                        AsyncImage(url: URL(string: model.teamIconName)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            if !model.teamIconName.isEmpty {
                                ProgressView()
                            }
                        }
                        .frame(width: 14, height: 14)
                        Text(model.teamName).font(.caption2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("gray80"))
                    }
                }
            }
            Spacer()
            HStack(alignment: .top, spacing: 10.0) {
                Text(model.goalsScored).font(.caption)
                    .frame(width: 30.0)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("gray80"))
                Text(model.matchesPlayed)
                    .font(.caption)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("gray80"))
                    .frame(width: 40.0)
            }
            .frame(height: 30.0, alignment: .center)
//            .background(model.backgroundColor) TODO: check ui if bug
        }
    }
}

struct ScorersListRow_Previews: PreviewProvider {
    static var previews: some View {
        ScorersListRow(model: HomeScorerModel(teamId: 1,
                                               teamName: "Rennes",
                                               teamIconName: "https://cdn.sportdataapi.com/images/soccer/teams/100/587.png",
                                               playerId: 1,
                                               playerName: "Laborde",
                                               position: "1",
                                               goalsScored: "15",
                                               matchesPlayed: "28"))
    }
}
