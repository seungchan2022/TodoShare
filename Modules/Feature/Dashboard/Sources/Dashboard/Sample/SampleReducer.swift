import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - SampleReducer

@Reducer
struct SampleReducer {
  let sideEffect: SampleSideEffect

  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: state.id, id: $0) })

      case .sample:
        state.fetchSample.isLoading = true
        return sideEffect
          .sample("sample usecase test")
          .cancellable(pageID: state.id, id: CancelID.requestSample, cancelInFlight: true)

      case .fetchSample(let result):
        print(result)
        state.fetchSample.isLoading = false
        switch result {
        case .success(let item):
          state.text = item
          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .onTapHome:
        sideEffect.routeToHome()
        return .none

      case .throwError(let error):
        sideEffect.useCaseGroup.toastViewModel.send(errorMessage: error.displayMessage)
        return .none
      }
    }
  }
}

extension SampleReducer {
  @ObservableState
  struct State: Equatable, Identifiable, Sendable {
    let id: UUID

    init(id: UUID = UUID()) {
      self.id = id
    }

    ///    var text = "sample usecase test"
    var text = ""

    var fetchSample = FetchState.Data<String?>(isLoading: false, value: .none)
  }

  enum Action: Equatable, BindableAction, Sendable {
    case binding(BindingAction<State>)
    case teardown

    case onTapHome

    case sample
    case fetchSample(Result<String, CompositeErrorRepository>)

    case throwError(CompositeErrorRepository)
  }
}

extension SampleReducer {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSample
  }
}
