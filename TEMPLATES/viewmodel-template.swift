@MainActor
final class ExampleViewModel: ObservableObject {

    @Published private(set) var state: State = .idle

    private let service: ExampleService

    init(service: ExampleService) {
        self.service = service
    }

    func load() async {

        state = .loading

        do {
            let result = try await service.fetch()
            state = .loaded(result)
        } catch {
            state = .error(error)
        }
    }
}