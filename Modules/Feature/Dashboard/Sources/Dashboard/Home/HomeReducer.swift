import Architecture
import ComposableArchitecture
import Foundation

// MARK: - HomeReducer

@Reducer
struct HomeReducer {
  let sideEffect: HomeSideEffect

  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: state.id, id: $0) })

      case .onTapBack:
        sideEffect.routeToBack()
        return .none

      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension HomeReducer {
  @ObservableState
  struct State: Equatable, Identifiable, Sendable {
    let id: UUID

    init(id: UUID = UUID()) {
      self.id = id
    }
  }

  enum Action: Equatable, BindableAction, Sendable {
    case binding(BindingAction<State>)
    case teardown

    case onTapBack

    case throwError(String)
  }
}

extension HomeReducer {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
