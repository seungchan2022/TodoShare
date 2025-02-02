import Architecture
import Foundation
import LinkNavigator
import Platform

@MainActor
final class AppContainer {

  // MARK: Lifecycle

  init(dependency: AppSideEffect = AppSideEffect.generate()) {
    let builder = AppRouterBuilderGroup<SingleLinkNavigator>()
    linkNavigator = .init(
      routeBuilderItemList: builder.applicationBuilders(),
      dependency: dependency)
  }

  // MARK: Internal

  let linkNavigator: SingleLinkNavigator

}
