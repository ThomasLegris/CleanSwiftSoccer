// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Swift Soccer
  internal static let appTitle = L10n.tr("Localizable", "app_title", fallback: "Swift Soccer")
  /// Chargement en cours
  internal static let commonLoading = L10n.tr("Localizable", "common_loading", fallback: "Chargement en cours")
  /// Erreur
  internal static let commonError = L10n.tr("Localizable", "commonError", fallback: "Erreur")
  /// Ok
  internal static let commonOk = L10n.tr("Localizable", "commonOk", fallback: "Ok")
  /// *
  ///  * Localization.
  internal static let dash = L10n.tr("Localizable", "dash", fallback: "-")
  /// Pas d'internet
  internal static let errorNoInternet = L10n.tr("Localizable", "errorNoInternet", fallback: "Pas d'internet")
  /// Verifiez votre connexion internet pour accéder à l'application SwiftSoccer
  internal static let errorNoInternetDescription = L10n.tr("Localizable", "errorNoInternetDescription", fallback: "Verifiez votre connexion internet pour accéder à l'application SwiftSoccer")
  /// Résultats
  internal static let homeLiveResults = L10n.tr("Localizable", "home_live_results", fallback: "Résultats")
  /// Classement
  internal static let homeRanking = L10n.tr("Localizable", "home_ranking", fallback: "Classement")
  /// Buteurs
  internal static let homeScorers = L10n.tr("Localizable", "home_scorers", fallback: "Buteurs")
  /// B
  internal static let scorersGoalsScored = L10n.tr("Localizable", "scorers_goals_scored", fallback: "B")
  /// MJ
  internal static let scorersMatchesPlayed = L10n.tr("Localizable", "scorers_matches_played", fallback: "MJ")
  /// Nom
  internal static let scorersName = L10n.tr("Localizable", "scorers_name", fallback: "Nom")
  /// Ligue 1
  internal static let seasonLigue1 = L10n.tr("Localizable", "season_ligue_1", fallback: "Ligue 1")
  /// Ligue 2
  internal static let seasonLigue2 = L10n.tr("Localizable", "season_ligue_2", fallback: "Ligue 2")
  /// Classements
  internal static let standingClubs = L10n.tr("Localizable", "standing_clubs", fallback: "Classements")
  /// db
  internal static let standingGoalDiff = L10n.tr("Localizable", "standing_goal_diff", fallback: "db")
  /// Pts
  internal static let standingPoints = L10n.tr("Localizable", "standing_points", fallback: "Pts")
  /// Rank
  internal static let standingRank = L10n.tr("Localizable", "standing_rank", fallback: "Rank")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
