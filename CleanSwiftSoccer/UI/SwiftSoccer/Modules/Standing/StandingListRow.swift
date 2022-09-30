//
//  StandingListRow.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Domain

/// Create a row to display a team rank in standing list.
struct StandingListRow: View {
    // MARK: - Internal Properties
    var model: HomeStandingModel

    // MARK: - UI
    var body: some View {
        HStack {
            HStack(spacing: 10.0) {
                Text(model.position)
                    .font(.caption)
                    .foregroundColor(model.positionTextColor)
                    .frame(width: 40.0)
                    .background(
                        RoundedRectangle(cornerRadius: 2.0)
                            .frame(width: CommonConstant.padding, height: 48)
                            .foregroundColor(model.positionBackgroundColor)
                    )
                AsyncImage(url: URL(string: model.teamIconName)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    if !model.teamIconName.isEmpty {
                        ProgressView()
                    }
                }
                .frame(width: 20, height: 20)
                Text(model.teamName)
                    .font(.caption)
                    .foregroundColor(Color("gray80"))
            }
            Spacer()
            HStack(spacing: 10.0) {
                Text(model.points).font(.caption)
                    .frame(width: 30.0)
                    .foregroundColor(Color("gray80"))
                Text(model.goalsInOut)
                    .font(.caption)
                    .foregroundColor(Color("gray80"))
                    .frame(width: 40.0)
            }
        }
        .background(model.backgroundColor)
        .frame(height: 40.0, alignment: .center)
    }
}

// MARK: - Preview
struct RankingListRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingListRow(model: HomeStandingModel(teamId: 1,
                                                 teamName: "Rennes",
                                                 position: "3",
                                                 points: "63",
                                                 teamIconName: "https://cdn.sportdataapi.com/images/soccer/teams/100/587.png",
                                                 goalsInOut: "50:23",
                                                 positionTextColorName: "white"))
    }
}
