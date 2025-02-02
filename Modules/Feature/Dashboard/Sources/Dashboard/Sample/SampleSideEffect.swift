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

  var sample: (String) -> Effect<SampleReducer.Action> {
    { text in
      .run { send in
        await send(SampleReducer.Action.fetchSample(.success(text)))
//        do {
//          await send(SampleReducer.Action.fetchSample(.success(text)))
//        } catch {
//          await send(SampleReducer.Action.fetchSample(.failure(.other(error))))
//        }
      }
    }
  }

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
