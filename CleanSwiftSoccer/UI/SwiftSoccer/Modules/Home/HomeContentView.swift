//
//  HomeContentView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Presentation
import Domain

/// The main view which display the content.
struct HomeContentView: View {
    // MARK: - Private Properties
    private let selectedPage: HomePageType
    private let interactor: HomeContentInteractor
    @State private var selectedLeague: SoccerLeague = .ligue1

    // MARK: - Init
    init(selectedPage: HomePageType,
         interactor: HomeContentInteractor) {
        self.interactor = interactor
        self.selectedPage = selectedPage
    }

    // MARK: - UI
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Picker("", selection: $selectedLeague) {
                ForEach(SoccerLeague.allCases, id: \.self) {
                    Text($0.name)
                        .foregroundColor(.white)
                }
            }
            .frame(height: CommonConstant.padding,
                   alignment: .top)
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, CommonConstant.padding)
            .padding(.top, CommonConstant.padding)

            switch selectedPage {
            case .standing:
                HomeStandingView(interactor: DIContainer.shared.homeStandingInteractor(selectedLeague: selectedLeague))
            case .scorers:
                HomeScorersView(interactor: DIContainer.shared.homeScorersInteractor(selectedLeague: selectedLeague))
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

// MARK: - Preview
struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(selectedPage: .standing,
                        interactor: DIContainer.shared.homeContentInteractor)
    }
}
