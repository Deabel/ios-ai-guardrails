
@MainActor
final class ExampleViewModel: ObservableObject {
    @Published private(set) var items:[String] = []
    private let service: ExampleService

    init(service: ExampleService) {
        self.service = service
    }

    func load() async throws {
        items = try await service.fetch()
    }
}
