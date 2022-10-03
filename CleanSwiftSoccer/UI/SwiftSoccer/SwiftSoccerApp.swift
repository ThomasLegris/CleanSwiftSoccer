//
//  SwiftSoccerApp.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS on 17/03/2022.
//

import SwiftUI
import SwiftyUserDefaults

@main
/// Main entry of the clean swift soccer app UI.
struct SwiftSoccerApp: App {
    @Environment(\.scenePhase) var scenePhase

    // MARK: - UI
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { newAppPhase in
                    if newAppPhase == .active {
                        // Listen app active launch and increase counter.
                        Defaults.appLaunchCounter += 1
                    }
                }
        }
    }
}
