//
//  HomeView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Presentation

/// Home view which displays a page according to its index.
struct HomeView: View {
    // MARK: - Private Properties
    @ObservedObject private var interactor: HomeInteractor
    @State var selectedPage: HomePageType = .standing

    // MARK: - Init
    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    // MARK: - UI
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selectedPage) {
                HomeContentView(selectedPage: selectedPage,
                                interactor: DIContainer.shared.homeContentInteractor)
                .padding(.top, CommonConstant.padding)
            }
            .background(.white)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)

            TabBarView(selectedPage: self.$selectedPage)
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(interactor: DIContainer.shared.homeInteractor)
    }
}
