//
//  DefaultKeys.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import SwiftyUserDefaults

/// Defines key to store in `UserDefaults`.
/// Using SwiftyUserDefaults pods.
extension DefaultsKeys {
    var appLaunchCounter: DefaultsKey<Int> { .init("key_app_launch_counter", defaultValue: 0) }
}
