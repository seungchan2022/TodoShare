import Architecture
import Dashboard
import Domain
import Foundation
import LinkNavigator
import Platform

// MARK: - AppSideEffect

struct AppSideEffect: DependencyType, DashboardSideEffect {
  let tostViewModel: ToastViewActionType
  let sampleUseCase: SampleUseCase
}

extension AppSideEffect {
  static func generate() -> AppSideEffect {
    .init(
      tostViewModel: ToastViewModel(),
      sampleUseCase: SampleUseCasePlatform())
  }
}
