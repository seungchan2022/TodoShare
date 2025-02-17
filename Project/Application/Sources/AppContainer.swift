import Architecture
import Foundation
import LinkNavigator
import Platform

@MainActor
final class AppContainer {

  // MARK: Lifecycle

  init(dependency: AppSideEffect = AppSideEffect.generate()) {
    self.dependency = dependency
    let builder = AppRouterBuilderGroup<SingleLinkNavigator>()
    linkNavigator = .init(
      routeBuilderItemList: builder.applicationBuilders(),
      dependency: dependency)
  }

  // MARK: Internal

  let linkNavigator: SingleLinkNavigator
  let dependency: AppSideEffect
}
