import Foundation

public protocol SampleUseCase: Sendable {
  var fire: () async -> SampleEntity { get }
}
