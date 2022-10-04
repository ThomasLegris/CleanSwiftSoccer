# CleanSwiftSoccer
Welcome to this repo. It's a SwiftUI app which gives info about French Soccer results. App is based on Clean architecture with a VIP pattern approach. It is using also DIP and several well known frameworks. Also organized in multi module.

## Features:
- Standings for Ligue 1 et and Ligue 2
- Favorite cities list to store towns registered by user
- Map view to find weather with location (lat & long) 
- Daily and weekly details for the town selected (available from each screen)
- Offline mode. Without connection, user has still several weather data about last city searched and favorite cities registered
- SDK's unit tests
- SDK's docs (using https://app.diagrams.net)

## Architecture:
Multimodule app
- UI
- Presentation
- UseCase
- Domain
- Data

## Main technical information:
- SwiftUI
- App preferences: `SwiftyUserDefaults`
- Persistance: `Realm`
- API call: `Alamofire`
- DataBinding: `Combine`
- Code quality: `Swiftlint`
- Managers: Custom DIP named `DIPContainer`


## UI:
![Capture d’écran 2022-10-03 à 17 16 56](https://user-images.githubusercontent.com/34026747/193613904-30fbfc89-f2a1-41e8-90aa-3ab0e44f5135.png)

## Notes:
- This app is based on another personal app which can be found here https://github.com/ThomasLegris/SwiftSoccer
- Assets source: https://www.flaticon.com
- API: https://app.sportdataapi.com 

## Tech Links
- https://www.raywenderlich.com/14223279-dependency-injection-tutorial-for-ios-getting-started
- https://rubygarage.org/blog/clean-swift-pros-and-cons
- https://github.com/kudoleh/iOS-Clean-Architecture-MVVM
- https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3
- https://nalexn.github.io/clean-architecture-swiftui/?utm_source=nalexn_github
