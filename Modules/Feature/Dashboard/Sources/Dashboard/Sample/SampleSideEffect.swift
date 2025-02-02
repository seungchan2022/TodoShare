import Architecture
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

// MARK: - SampleSideEffect

struct SampleSideEffect {
  let useCaseGroup: DashboardSideEffect
  let navigator: RootNavigatorType
}

extension SampleSideEffect {
  var routeToHome: () -> Void {
    {
      navigator.next(
        linkItem: LinkItem(
          path: Link.Dashboard.Path.home.rawValue,
          items: .none),
        isAnimated: true)
    }
  }
}
