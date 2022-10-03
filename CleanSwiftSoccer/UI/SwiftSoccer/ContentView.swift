//
//  ContentView.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS on 17/03/2022.
//

import SwiftUI
import Network
import Alamofire

/// Initial app content view.
struct ContentView: View {
    // MARK: - Private Properties
    @State private var isNotReachable = NetworkReachabilityManager.default?.isReachable == false

    // MARK: - Init
    init() {
        // Create a UINavigationBarAppearance object
        let appearance = UINavigationBarAppearance()
        // Clear default background color
        appearance.shadowColor = .none

        // Issue with default tint.
        appearance.backgroundColor = Asset.red50.color.withAlphaComponent(0.43)

        // And use your config object
        if let font =  UIFont(name: "HelveticaNeue", size: 22) {
            appearance.titleTextAttributes = [.font: font,
                                              .foregroundColor: UIColor.white]
        }
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().barTintColor = Asset.red50.color
    }

    // MARK: - UI
    var body: some View {
        NavigationView {
            VStack {
                HomeView(interactor: DIContainer.shared.homeInteractor)
                    .alert(isPresented: $isNotReachable) {
                        Alert(title: Text(L10n.errorNoInternet),
                              message: Text(L10n.errorNoInternetDescription),
                              dismissButton: .cancel())
                    }
                    .foregroundColor(.white)
                    .navigationTitle(L10n.appTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .font(.title)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                // TODO: Implements `Setting` feature.
                                print("Pressed Menu")
                            } label: {
                                Image(Asset.icMenu.name)
                                    .resizable()

                            }
                        }
                    }
            }
        }}
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
