//
//  HomeView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftUI
import Presentation

struct HomeTabBar: View {
    @Binding var selectedPage: HomePageType
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selectedPage) {
                HomeContentView(selectedPage: selectedPage,
                                interactor: DIContainer.shared.homeContentInteractor)
                    .padding(.vertical, CommonConstant.padding)
                    .padding(.horizontal, 16.0)
            }
            .background(.white)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(selectedPage: self.$selectedPage)
        }
    }
}

/// Home view which displays a page according to its index.
struct HomeView: View {
    // MARK: - Private Properties
    @ObservedObject private var interactor: HomeInteractor
    @State var selectedPage: HomePageType = .standing

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    // MARK: - UI
    var body: some View {
            HomeTabBar(selectedPage: $selectedPage)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(interactor: DIContainer.shared.homeInteractor)
    }
}