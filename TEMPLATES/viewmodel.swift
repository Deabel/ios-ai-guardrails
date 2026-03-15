import Foundation

@MainActor
final class ExampleViewModel: ObservableObject {

    enum State: Equatable {
        case idle
        case loading
        case loaded([String])
        case failed(String)
    }

    @Published private(set) var state: State = .idle

    private let service: ExampleService

    init(service: ExampleService) {
        self.service = service
    }

    func load() async {
        state = .loading

        do {
            let items = try await service.fetch()
            state = .loaded(items)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
