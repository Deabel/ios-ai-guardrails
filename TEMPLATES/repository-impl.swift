struct DefaultExampleRepository: ExampleRepository {

    private let service: ExampleService

    init(service: ExampleService) {
        self.service = service
    }

    func load() async throws -> [String] {
        try await service.fetch()
    }
}
